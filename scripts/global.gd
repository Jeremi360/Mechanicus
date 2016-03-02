extends Node2D

#Scene
var root
var player
var sp

#EditGui
var editgui
var rotset
var friset
var massset

#DockPlayerMode
var dpm 

func _ready():
	#string
	#node paths
	#Scene
	root = "/root/SceneRoot"
	player = root + "/Player"
	sp = player + "/SpawnPoint"
	
	#Camera And UI
	editgui = root + "/DockEditMode"
	dpm = root + "/DockPlayerMode"
	
	#node
	rotset = get_node(editgui + "/RotSet")
	friset = get_node(editgui + "/FriSet")
	massset = get_node(editgui + "/MassSet")
	
	#const
	#Scene
	Globals.set("root", get_node(root))
	Globals.set("GScript", self)
	Globals.set("Player", get_node(player))
	Globals.set("SpawnPoint", get_node(sp))
	
	#Camera And UI
	Globals.set("root", get_node(root))
	Globals.set("EditGui", get_node(editgui))
	Globals.set("DockPlayerMode", get_node(dpm))
	Globals.set("RotSet", rotset)
	Globals.set("FriSet",  friset)
	Globals.set("MassSet", massset)
	Globals.set("PreScaleBox", get_node(dpm + "/PreScaleBox"))
	Globals.set("PrePosBox", get_node(dpm + "/PrePosBox"))
	Globals.set("Pause", get_node(root + "/Pause"))
	
	#var
	#EditMode
	Globals.set("SpawnPoint", get_node(sp))
	Globals.set("edit_mode", false)
	Globals.set("edit_cur_obj", null)
	Globals.set("info_cur_obj", null)
	
	#Cam
	Globals.set("PlayerCam", get_node(player + "/Camera2D"))

#Global Funcs
#
# use: Globals.get("GScript").name_of_func(args)
#
func update():
	get_node(root).update()
	get_node(editgui).update()
	
	if Globals.get("edit_mode"):
		Globals.get("edit_cur_obj").update()

func hide_edit():
	if not rotset.is_hidden():
		rotset.hide()
	
	if not friset.is_hidden():
		friset.hide()
		
	if not massset.is_hidden():
		massset.hide()

func hide_pres():
	if not Globals.get("PreScaleBox").is_hidden():
		Globals.get("PreScaleBox").hide()
	
	if not Globals.get("PrePosBox").is_hidden():
		Globals.get("PrePosBox").hide()
