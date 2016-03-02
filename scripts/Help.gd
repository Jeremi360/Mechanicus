extends PopupPanel

var pnum = 1
var lnum = 7
var cpage
var ppage
var prevb
var posx
var xoffset = 300
export var move = true

func _ready():
	cpage = get_node("Page1")
	prevb = get_node("Prevb")
	_go_to_page(1)
	show()
	set_fixed_process(move)

func _fixed_process(delta):
	posx = Globals.get("Player").get_pos().x - xoffset
	set_pos(Vector2(posx, get_pos().y))

func _go_to_page(num):
	ppage = cpage
	pnum  = num
	cpage = get_node("Page" + var2str(num))
	ppage.hide()
	
	if num == 1:
		prevb.hide()
	
	else:
		prevb.show()
	
	cpage.show()

func _on_Xb_pressed():
	self.hide()
	_go_to_page(1)

func _on_Prevb_pressed():
	_go_to_page(pnum - 1)

func _on_Nextb_pressed():
	if pnum < lnum:
		_go_to_page(pnum + 1)
	
	elif pnum == lnum:
		self.hide()
		_go_to_page(1)

func _on_list():
	Globals.get("DockPlayerMode").hide()
	get_node("/root/SceneRoot/MechList").show()
	get_tree().set_pause(true)
