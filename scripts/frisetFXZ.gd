extends Node2D

const maxf = 100
const minf = 0
var slider
var ledit
var curobj
var fri
var nfri

func _ready():
	slider = get_node("HSlider")
	ledit = get_node("LineEdit")

func update():
	if Globals.get("edit_cur_obj") == null:
		curobj = null
		ledit.set_text(var2str(maxf*100))
		slider.set_value(maxf*100)
	
	else:
		curobj = Globals.get("edit_cur_obj")
		fri = curobj.get_friction()*100
		ledit.set_text(var2str(fri))
		slider.set_value(fri)

func _change_fri(d):
	fri = curobj.get_friction()
	nfri = (fri + d)*100
	ledit.set_text(var2str(nfri))
	slider.set_value(nfri)
	curobj.set_friction(nfri/100)

func _on_25plus():
	if curobj == null or curobj.get_friction() == 1:
		pass
	
	else:
		_change_fri(0.25)

func _on_25minus():
	if curobj == null or curobj.get_friction() == 0:
		pass
	
	else:
		_change_fri(-0.25)

func _on_HSlider_value_changed(value):
	if curobj == null:
		pass
	
	else:
		ledit.set_text(var2str(value))
		curobj.set_friction(value/100)
