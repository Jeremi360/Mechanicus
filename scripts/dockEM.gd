extends Node2D

var curobj

var mass_edit = true
var rot_edit  = true
var fri_edit  = true
var SmallPos  = Vector2(-67, 350)
var NormalPos = Vector2(580, -437)
var use_Small = false

func _ready():
	updateZwei()
	set_fixed_process(true)

func make_inst():
	pass

func updateZwei():
	if not mass_edit:
		get_node("MassSet").hide()
	else:
		get_node("MassSet").show()
	
	if not rot_edit:
	 	get_node("RotSet").hide()
	else:
		get_node("RotSet").show()
	
	if not fri_edit:
		get_node("FriSet").hide()
	else:
		get_node("FriSet").show()
	
	if use_Small:
		get_node("Sprite").hide()
		get_node("SmallNode/SmallSprite").show()
		get_node("SmallNode").set_pos(SmallPos)
	
	else:
		get_node("SmallNode/SmallSprite").hide()
		get_node("Sprite").show()
		get_node("SmallNode").set_pos(NormalPos)

func make_small(bo):
	if bo:
		mass_edit = false
		rot_edit  = false
		fri_edit  = false
		use_Small = true
	
	else:
		mass_edit = true
		rot_edit  = true
		fri_edit  = true
		use_Small = false
		
	updateZwei()

func update():
	curobj = Globals.get("edit_cur_obj")
	
	if Globals.get("edit_mode"):
		curobj.edit_mode_set()

func _fixed_process(delta):
	if curobj == null:
		pass
	
	else:
		if Input.is_action_pressed("ok"):
			end_edit()

func _on_OK():
	if curobj == null:
		pass
	else:
		end_edit()

func end_edit():
	if curobj != null:
		curobj.end_edit()
		curobj.make_inst()
	
	Globals.set("edit_mode", false)
	Globals.set("edit_cur_obj", null)
	Globals.get("GScript").update()
	Globals.get("DockPlayerMode").show()
	Globals.get("EditGui").hide()

func _on_Cancel():
	curobj.queue_free()
	end_edit()
	
