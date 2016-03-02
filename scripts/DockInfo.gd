extends Node2D

var curobj = null
var pos
var offset = Vector2(0, 0)

func _ready():
	if curobj != null:
		set_curobj(curobj)
		self.set_z(6)

func set_curobj(xcurobj):
		get_node("Node2T").set_curobj(xcurobj)
		get_node("Node2P").set_curobj(xcurobj)
		get_node("Node2PK").set_curobj(xcurobj)
		get_node("Node2Pos").set_curobj(xcurobj)
		curobj = xcurobj
		set_fixed_process(true)

func _fixed_process(delta):
	pos = curobj.expos.get_global_pos()
	pos = Vector2(pos.x + offset.x, pos.y + offset.y)
	self.set_pos(pos)

func _on_Button_pressed():
	curobj.off_info()
	curobj.info = false
	self.queue_free()
