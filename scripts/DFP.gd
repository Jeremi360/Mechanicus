extends Node2D

var curobj = null
var v
var PR
var T
var Rx
var Ry
var textx
var texty
var LinEx
var LinEy

func _ready():
	if curobj != null:
		set_curobj(curobj)
		
func set_curobj(xcurobj):
		LinEx = get_node("LineEditX")
		LinEy = get_node("LineEditY")
		PR = xcurobj.get_global_pos()
		curobj = xcurobj
		
		if self.is_hidden():
			set_fixed_process(false)
		else:
			set_fixed_process(true)

func _fixed_process(delta):
	v = curobj.get_linear_velocity()
	T = delta
	Rx = abs(PR.x - curobj.get_global_pos().x)
	Ry = abs(PR.y - curobj.get_global_pos().y)
	textx = var2str(v.x) + " = " + var2str(Rx) + " / " + var2str(T)
	texty = var2str(v.y) + " = " + var2str(Ry) + " / " + var2str(T)
	LinEx.set_text(textx)
	LinEy.set_text(texty)
	PR = curobj.get_global_pos()
	
