extends Node2D

var curobj = null
var pos
var xpos
var xdeg
var offset = Vector2(0, 0)
var startPos
var endPos
var LinESX
var LinESY
var LinEMX
var LinEMY
var LinEEX
var LinEEY
var LinER

func _ready():
	LinESX = get_node("Node2PosStart/LinEX")
	LinESY = get_node("Node2PosStart/LinEY")
	LinEMX = get_node("Node2PosMain/LinEX")
	LinEMY = get_node("Node2PosMain/LinEY")
	LinEEX = get_node("Node2PosEnd/LinEX")
	LinEEY = get_node("Node2PosEnd/LinEY")
	LinER  = get_node("Node2Alfa/LinE")
	
	if curobj != null:
		set_curobj(curobj)
		set_z(6)

func set_curobj(xcurobj):
	curobj   = xcurobj
	startPos = xcurobj.startpos
	endPos   = xcurobj.endpos
	set_fixed_process(true)

func _fixed_process(delta):
	pos = curobj.expos.get_global_pos()
	pos = Vector2(pos.x + offset.x, pos.y + offset.y)
	self.set_pos(pos)
	
	xpos = curobj.center.get_global_pos()
	LinEMX.set_text(var2str(xpos.x))
	LinEMY.set_text(var2str(xpos.y))
	
	xpos = startPos.get_global_pos()
	LinESX.set_text(var2str(xpos.x))
	LinESY.set_text(var2str(xpos.y))
	
	xpos = endPos.get_global_pos()
	LinEEX.set_text(var2str(xpos.x))
	LinEEY.set_text(var2str(xpos.y))
	
	xdeg = rad2deg(curobj.get_rot())
	LinER.set_text(var2str(xdeg))

func _on_Button_pressed():
	curobj.off_info()
	curobj.info = false
	self.queue_free()
