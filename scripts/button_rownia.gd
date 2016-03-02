extends Button

var preScaleBox

func _ready():
	preScaleBox = Globals.get("PreScaleBox")
	preScaleBox.hide()

func _on_RowniaButton():
	Globals.get("GScript").hide_pres()
	preScaleBox.show()
