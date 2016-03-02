extends Node2D

var ball

func _ready():
	ball = get_node("Ball")

func _on_Button():
	self.queue_free()







