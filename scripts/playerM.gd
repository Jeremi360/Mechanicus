extends RigidBody2D

export var speed = 300
export var accel = 5
export var jumpf = 200
export var fly = false

var move_left
var move_right
var jump
var rc
var sprite
var lvy
var current_speed = 0
var edit = false
var arot = 0
var expos
var pos
var inst
var infogui
var info = false

var prespeed = 0

func make_inst():
	pass

func _ready():
	expos    = get_node("SpawnPoint")
	infogui  = preload("res://tscns/ui/DockInfo.tscn")
	sprite   = get_node("Sprite")
	rc       = get_node("RayCast2D")
	rc.add_exception(self)
	set_fixed_process(true)

func edit_mode_set():
	Globals.get("FriSet").show()
	Globals.get("MassSet").show()
	Globals.get("RotSet").hide()

func update():
	Globals.get("FriSet").update()
	Globals.get("MassSet").update()

func _fixed_process(delta):
	if not Globals.get("edit_mode") and not edit:
		get_node("Button").show()
		move_right = Input.is_action_pressed("move_right")
		move_left  = Input.is_action_pressed("move_left")
		jump       = Input.is_action_pressed("jump")
		
		if move_right:
			if sprite.is_flipped_h():
				sprite.set_flip_h(false)
			
			self.set_axis_velocity(Vector2(speed, 0))
			
		elif move_left:
			if not sprite.is_flipped_h():
				sprite.set_flip_h(true)
			self.set_axis_velocity(Vector2(-speed, 0))
		
		if not fly:
			if(rc.is_colliding() and jump):
				self.set_axis_velocity(Vector2(0, -jumpf))
		else:
			if jump:
				self.set_axis_velocity(Vector2(0, -jumpf))

	elif (Globals.get("edit_mode") and edit):
		
		self.set_rot(arot)
		get_node("Button").hide()
		Globals.get("EditGui").set_pos(get_node("SpawnPoint").get_global_pos())
		
		if Input.is_action_pressed("move_up"):
			self.set_linear_velocity(Vector2(0, -speed))
		
		elif Input.is_action_pressed("move_down"):
			self.set_linear_velocity(Vector2(0, speed))
		
		elif Input.is_action_pressed("move_left"):
			self.set_linear_velocity(Vector2(-speed, 0))
		
		elif Input.is_action_pressed("move_right"):
			self.set_linear_velocity(Vector2(speed, 0))
		
		else:
			get_node("Button").show()
			self.set_linear_velocity(Vector2(0, 0))
	
	else:
		get_node("Button").show()
		self.set_axis_velocity(Vector2(0, speed))

func end_edit():
	self.set_gravity_scale(1)
	self.edit = false
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

func on_info():
	get_node("Button").hide()
	get_node("Button1").hide()
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

