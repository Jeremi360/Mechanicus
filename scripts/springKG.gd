extends RigidBody2D

var edit = false
var speed = 100

var expos
var pos
var inst
var infogui
var info = false

func _ready():
	expos    = get_node("Position2D")
	infogui  = preload("res://tscns/ui/DockInfo.tscn")
	set_fixed_process(true)

func make_inst():
	pass

func _fixed_process(delta):
	if (Globals.get("edit_mode") and edit):
		
		get_node("Button").hide()
		get_node("Button1").hide()
		Globals.get("EditGui").set_pos(get_node("Position2D").get_global_pos())
		
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

func edit_mode_set():
	Globals.get("FriSet").hide()
	Globals.get("MassSet").show()
	Globals.get("RotSet").hide()

func update():
	Globals.get("MassSet").update()

func end_edit():
	self.set_gravity_scale(1)
	self.edit = false
	Globals.set("edit_cur_obj", null)
	Globals.set("edit_mode", false)
	Globals.get("GScript").hide_edit()
	Globals.get("PlayerCam").make_current()

func _on_edit():
	self.set_gravity_scale(0)
	Globals.set("edit_cur_obj", self)
	edit = true
	Globals.set("edit_mode", true)
	Globals.get("GScript").update()
	Globals.get("EditGui").show()
	get_node("Camera2D").make_current()

func on_e():
	_on_edit()

func  on_info(xinfo = info):
	if not xinfo:
		get_node("Button").hide()
		get_node("Button1").hide()
		get_node("Button2").hide()
		inst = infogui.instance()
		inst.set_global_pos(expos.get_global_pos())
		inst.set_z(0)
		inst.set_curobj(self)
		Globals.get("root").add_child(inst)
		info = true
	
	else:
		info = false
		get_node("Button").show()
		get_node("Button1").show()
		get_node("Button2").show()