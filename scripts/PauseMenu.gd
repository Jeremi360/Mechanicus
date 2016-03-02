extends PopupPanel

var pos
var offset = Vector2(0, -300)

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if Input.is_action_pressed("exit") and self.is_hidden():
		on_popup()
	
	elif Input.is_action_pressed("exit") and not self.is_hidden():
		on_continue()

func on_popup():
	pos = Globals.get("Player").get_global_pos()
	pos = Vector2(pos.x + offset.x, pos.y + offset.y)
	self.set_pos(pos)
	self.set_exclusive(true)
	self.popup()
	get_tree().set_pause(true)

func on_continue():
	self.hide()
	get_tree().set_pause(false)

func _on_help():
	on_continue()
	get_node("/root/SceneRoot/HelpDialog").show()

func _on_exit():
	get_tree().quit()

func _on_help1_pressed():
	self.hide()
	get_node("/root/SceneRoot/MechList").show()
	Globals.get("DockPlayerMode").hide()

