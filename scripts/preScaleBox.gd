extends Node2D

var inst
var pos


onready var rowniaxy = preload("res://tscns/mechs/rownia03.tscn")
onready var rowniaxxy = preload("res://tscns/mechs/rownia03x2.tscn")
onready var rowniaxyy = preload("res://tscns/mechs/rownia03y2.tscn")
onready var rowniaxxyy = preload("res://tscns/mechs/rownia03x2y2.tscn")

func _make_inst(obj):
	inst = obj.instance()
	pos = Globals.get("SpawnPoint").get_global_pos()
	inst.set_pos(pos)
	Globals.get("root").add_child(inst)
	self.hide()

func _on_2x2y():
	_make_inst(rowniaxxyy)

func _on_1x2y():
	_make_inst(rowniaxyy)

func _on_2x1y():
	_make_inst(rowniaxxy)

func _on_1x1y():
	_make_inst(rowniaxy)

func _on_Anuluj():
	self.hide()
