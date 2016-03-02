extends Node2D

const maxr = 360
const minr = 0
var slider
var ledit
var curobj
var rot
var nrot

func _ready():
	slider = get_node("HSlider")
	ledit = get_node("LineEdit")

func update():
	if Globals.get("edit_cur_obj") == null:
		curobj = null
		slider.set_value(minr)

	else:
		curobj = Globals.get("edit_cur_obj")
		rot = rad2deg(curobj.get_rot())
		slider.set_value(rot)

func _rot_by(delta):
	if curobj == null:
		pass
	
	else:
		rot = rad2deg(curobj.get_rot())
		nrot = rot + delta
		slider.set_value(nrot)

func _on_15plus():
	_rot_by(15)

func _on_45plus():
	_rot_by(45)

func _on_15minus():
	_rot_by(-15)

func _on_45minus():
	_rot_by(-45)

func _on_HSlider_value_changed(value):
	if curobj == null:
		pass
	
	else:
		curobj.set_rot(deg2rad(value))
		ledit.set_text(var2str(value))
		curobj.arot = curobj.get_rot()





