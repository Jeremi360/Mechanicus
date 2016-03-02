extends Sprite

var inst
var Eoffset = -120
var pos
onready var box = preload("res://tscns/mechs/box.tscn")
onready var ball = preload("res://tscns/mechs/ball.tscn")
onready var prechain = preload("res://tscns/mechs/prechain.tscn")
onready var prespring = preload("res://tscns/mechs/prespring.tscn")

func _make_inst(obj, offset = 0):
	inst = obj.instance()
	pos = Globals.get("SpawnPoint").get_global_pos()
	pos = Vector2(pos.x , pos.y + offset)
	inst.set_global_pos(pos)
	inst.set_z(0)
	Globals.get("root").add_child(inst)

func _on_box():
	_make_inst(box)
	
func _on_Chain():
	_make_inst(prechain, Eoffset)
	
func _on_Spring():
	_make_inst(prespring, Eoffset)

func _on_Ball():
	_make_inst(ball)
