extends RigidBody2D

var edit = false
var speed = 100
var expos
var pos
var inst
var infogui
var info = false

func on_info():
	get_node("Button").hide()
	get_node("Button1").hide()
	get_node("Button2").hide()
	inst = infogui.instance()
	inst.set_global_pos(expos.get_global_pos())
	inst.set_z(0)
	inst.set_curobj(self)
	Globals.get("root").add_child(inst)
	info = true

func off_info():
	info = false
	get_node("Button").show()
	get_node("Button1").show()
	get_node("Button2").show()

func _ready():
	expos    = get_node("Position2D")
	infogui  = preload("res://tscns/ui/DockInfo.tscn")
	set_fixed_process(true)

func _on_edit():
	Globals.set("edit_cur_obj", self)
	edit = true
	Globals.set("edit_mode", true)
	Globals.get("GScript").update()
	Globals.get("EditGui").show() 

func on_e():
	_on_edit()

func make_inst():
	pass

func end_edit():
	self.edit = false
	Globals.set("edit_mode", false)
	Globals.get("GScript").hide_edit()
	Globals.get("PlayerCam").make_current()

func edit_mode_set():
	Globals.get("RotSet").hide()
	Globals.get("FriSet").hide()
	Globals.get("MassSet").show()
	get_node("Camera2D").make_current()

func update():
	Globals.get("MassSet").update()

func _fixed_process(delta):
	if (Globals.get("edit_mode") and edit):
		Globals.get("EditGui").set_pos(get_node("Position2D").get_global_pos())
		get_node("Button").hide()
		get_node("Button1").hide()
		get_node("Button2").hide()
		
		if Input.is_action_pressed("move_up"):
			self.set_linear_velocity(Vector2(0, -speed))
		
		elif Input.is_action_pressed("move_down"):
			self.set_linear_velocity(Vector2(0, speed))
		
		elif Input.is_action_pressed("move_left"):
			self.set_linear_velocity(Vector2(-speed, 0))
		
		elif Input.is_action_pressed("move_right"):
			self.set_linear_velocity(Vector2(speed, 0))
		
		else:
			self.set_linear_velocity(Vector2(0, 0))
		
	else:
		get_node("Button").show()
		get_node("Button1").show()
