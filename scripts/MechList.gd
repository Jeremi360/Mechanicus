extends Node2D

var pos
export var offset = Vector2(0, -200)
var pnum = 1
var lnum = 5
var cpage
var ppage
var cgotop
var pgotop 
var prevb
var nextb
export var debug = false
export var move = true

func _ready():
	cpage  = get_node("Page1")
	cgotop = get_node("Control/GoToPage1")
	prevb  = get_node("Control/Prevb")
	nextb  = get_node("Control/Nextb")
	cgotop.set_disabled(true)
	prevb.hide()
	set_fixed_process(move)

func _fixed_process(delta):
	if not self.is_hidden() and not debug:
		pos = Globals.get("Player").get_global_pos()
		pos = Vector2(pos.x + offset.x, pos.y + offset.y)
		self.set_pos(pos)

func _go_to_page(num):
	pnum  = num
	
	ppage = cpage
	cpage = get_node("Page" + var2str(num))
	ppage.hide()
	
	if num == 1:
		prevb.hide()
	
	elif num == lnum:
		nextb.hide()
	
	else:
		prevb.show()
		nextb.show()
	
	pgotop = cgotop
	cgotop = get_node("Control/GoToPage" + var2str(num))
	pgotop.set_disabled(false)
	cgotop.set_disabled(true)
	
	cpage.show()

func _on_Exit_pressed():
	if debug:
		queue_free()
	
	else:
		get_tree().set_pause(false)
		self.hide()
		Globals.get("DockPlayerMode").show()

func _on_Prevb_pressed():
	_go_to_page(pnum - 1)

func _on_Nextb_pressed():
	_go_to_page(pnum + 1)

