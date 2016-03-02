extends Node2D

var LinE
var curobj = null
var Pk
var Prad
var rad
var w
var text

func _ready():
	if curobj != null:
		set_curobj(curobj)
		
func set_curobj(xcurobj):
		LinE = get_node("LinE")
		Prad = xcurobj.get_rot()
		curobj = xcurobj
		
		if self.is_hidden():
			set_fixed_process(false)
		else:
			set_fixed_process(true)
	
func _fixed_process(delta):
	rad = abs(Prad - curobj.get_rot())
	w = rad/delta
	text = var2str(w) + " = " + var2str(rad) + " / " + var2str(delta)
	LinE.set_text(text)
	Prad = curobj.get_rot()
	

