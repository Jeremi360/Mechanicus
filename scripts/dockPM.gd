extends Node2D

var ppos
export var offset = Vector2(0, -100)
var press = false

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if Globals.get('edit_mode'):
		self.hide()
	
	else:
		ppos = Globals.get("Player").get_pos()
		self.set_pos(Vector2(ppos.x + offset.x, ppos.y + offset.y))
		self.show()
	
	if Input.is_action_pressed("menu"):
		if press:
			press = false
		
		else:
			press = true
