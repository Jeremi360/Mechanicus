extends Node2D

var pos
var inst

onready var dwigs = preload("res://tscns/mechs/dwignews.tscn")
onready var dwigm = preload("res://tscns/mechs/dwignew.tscn")
onready var dwige = preload("res://tscns/mechs/dwignewe.tscn")

func _make_inst(obj):
	inst = obj.instance()
	pos = Globals.get("SpawnPoint").get_global_pos()
	inst.set_pos(pos)
	Globals.get("root").add_child(inst)
	self.hide()

func _on_Start():
	_make_inst(dwigs)

func _on_Middle():
	_make_inst(dwigm)

func _on_End():
	_make_inst(dwige)

func _on_Anuluj():
	self.hide()



