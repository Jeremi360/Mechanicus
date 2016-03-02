extends Node2D

var ledit
var curobj
var mass
var nmass

func _ready():
	ledit = get_node("LineEdit")

func update():
	if Globals.get("edit_cur_obj") == null:
		curobj = null
		ledit.set_text(var2str(1))
	
	else:
		curobj = Globals.get("edit_cur_obj")
		mass = curobj.get_mass()
		ledit.set_text(var2str(mass))

func _change_mass(d):
	mass = curobj.get_mass()
	nmass = (mass + d)
	ledit.set_text(var2str(nmass))
	curobj.set_mass(nmass)

func _on_25plus():
	if curobj == null:
		pass
	
	else:
		_change_mass(0.25)

func _on_25minus():
	if curobj == null:
		pass
	
	else:
		_change_mass(-0.25)

