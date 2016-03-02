extends Node2D

var kg

func _ready():
	kg = get_node("KG")

func _on_Button():
	self.queue_free()





