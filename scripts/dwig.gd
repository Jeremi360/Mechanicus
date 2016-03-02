extends Node2D

var edit = false
var Base
var Action
var speed = 100
var startpos
var endpos
var expos
var pos
var inst
var infogui
var info = false
var center
export var edit_on_ready = true

func _ready():
	expos    = get_node("Base/Position2D")
	infogui  = preload("res://tscns/ui/DockInfoDwig.tscn")
	startpos = get_node("Action/PosStart")
	endpos   = get_node("Action/PosEnd")
	Base	 = get_node("Base")
	Action	 = get_node("Action")
	center	 = get_node("PinJoint2D")

	if edit_on_ready:
		_on_edit()
		set_fixed_process(true)

func make_inst():
	pass

func on_info():
	get_node("Base/Button").hide()
	get_node("Base/EditButton").hide()
	get_node("Base/info").hide()
	inst = infogui.instance()
	inst.set_global_pos(expos.get_global_pos())
	inst.set_z(0)
	inst.set_curobj(self)
	Globals.get("root").add_child(inst)
	info = true
	return inst

func off_info():
	info = false
	get_node("Base/Button").show()
	get_node("Base/EditButton").show()
	get_node("Base/info").show()

func _on_edit():
	Action.set_gravity_scale(0)
	Base.set_gravity_scale(0)
	
	Globals.set("edit_cur_obj", self)
	edit = true
	Globals.set("edit_mode", true)
	Globals.get("GScript").update()
	Globals.get("EditGui").show() 
	get_node("Base/Camera2D").make_current()

func edit_mode_set():
	Globals.get("EditGui").make_small(true)

func update():
	pass

func _fixed_process(delta):
	
	if (Globals.get("edit_mode") and edit):
		
		get_node("Base/Button").hide()
		Globals.get("EditGui").set_pos(get_node("Base/Position2D").get_global_pos())
		
		if Input.is_action_pressed("move_up"):
			Action.set_linear_velocity(Vector2(0, -speed))
			Base.set_linear_velocity(Vector2(0, -speed))
		
		elif Input.is_action_pressed("move_down"):
			Action.set_linear_velocity(Vector2(0, speed))
			Base.set_linear_velocity(Vector2(0, speed))
			
		elif Input.is_action_pressed("move_left"):
			Action.set_linear_velocity(Vector2(-speed, 0))
			Base.set_linear_velocity(Vector2(-speed, 0))
		
		elif Input.is_action_pressed("move_right"):
			Action.set_linear_velocity(Vector2(speed, 0))
			Base.set_linear_velocity(Vector2(speed, 0))
		
		else:
			Action.set_linear_velocity(Vector2(0, 0))
			Base.set_linear_velocity(Vector2(0, 0))
			
	else:
		get_node("Base/Button").show()
		Base.set_linear_velocity(Vector2(0, speed))

func end_edit():
	Action.set_gravity_scale(1)
	Base.set_gravity_scale(1)
	
	self.edit = false
	Globals.set("edit_mode", false)
	Globals.get("GScript").hide_edit()
	Globals.get("EditGui").make_small(false)
	Globals.get("PlayerCam").make_current()

func _on_Button_pressed():
	self.queue_free()

