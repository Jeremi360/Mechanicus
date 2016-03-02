extends Button

var prePosBox

func _ready():
	prePosBox = Globals.get("PrePosBox")
	prePosBox.hide()

func _on_Dzwignia():
	Globals.get("GScript").hide_pres()
	prePosBox.show()
