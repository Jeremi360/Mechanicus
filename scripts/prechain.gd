extends RigidBody2D

var edit = false
var speed = 100
var inst
var chain

func edit_mode_set():
	Globals.get("EditGui").make_small(true)

func update():
	pass

func _fixed_process(delta):
	self.set_rot(0)
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

func end_edit():
	self.set_gravity_scale(1)
	self.edit = false
	Globals.set("edit_cur_obj", null)
	Globals.set("edit_mode", false)
	Globals.get("GScript").hide_edit()
	Globals.get("EditGui").make_small(false)

func make_inst():
	chain = preload("res://tscns/mechs/chain.tscn")
	inst = chain.instance()
	inst.set_pos(self.get_pos())
	self.queue_free()
	Globals.get("root").add_child(inst)
	Globals.get("PlayerCam").make_current()
	Globals.get("EditGui").make_small(false)

func on_edit():
	self.set_gravity_scale(0)
	Globals.set("edit_cur_obj", self)
	edit = true
	Globals.set("edit_mode", true)
	Globals.get("GScript").update()
	Globals.get("EditGui").show()
	get_node("Camera2D").make_current()

func _ready():
	on_edit()
	set_fixed_process(true)


