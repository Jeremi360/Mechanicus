extends Node2D

var LinE
var curobj = null
var fri
var M
var T
var text

func _ready():
	if curobj != null:
		set_curobj(curobj)
		
func set_curobj(xcurobj):
		LinE = get_node("LineEdit")
		curobj = xcurobj
		
		if self.is_hidden():
			set_fixed_process(false)
		else:
			set_fixed_process(true)
	
func _fixed_process(delta):
	fri = curobj.get_friction()
	M = curobj.get_mass()
	T = fri * M
	text = var2str(T) + " = " + var2str(fri) + " * " + var2str(M)
	LinE.set_text(text)
	

