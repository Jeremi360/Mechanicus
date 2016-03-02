extends Node2D

var LinEX
var LinEY
var pos
var curobj = null

func _ready():
	if curobj != null:
		set_curobj(curobj)
		
func set_curobj(xcurobj):
		LinEX = get_node("LinEX")
		LinEY = get_node("LinEY")
		curobj = xcurobj
		
		if self.is_hidden():
			set_fixed_process(false)
		else:
			set_fixed_process(true)
	
func _fixed_process(delta):
	pos = curobj.get_global_pos()
	LinEX.set_text(var2str(pos.x))
	LinEY.set_text(var2str(pos.y))

