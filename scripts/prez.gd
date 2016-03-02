extends AnimationPlayer

var snum = 0
var lsid = 6
var timer
var posF
var posS
var posT
var inst
var nodF
var nodS
var nodT
var box
var ball
var chain
var spring
var rown
var dwigm
var gui

func _ready():
	box    = preload("res://tscns/mechs/box.tscn")
	rown   = preload("res://tscns/mechs/rownia03x2.tscn")
	ball   = preload("res://tscns/mechs/ball.tscn")
	chain  = preload("res://tscns/mechs/chain.tscn")
	spring = preload("res://tscns/mechs/spring.tscn")
	dwigm  = preload("res://tscns/mechs/dwignew.tscn")
	
	timer  = get_node("Timer")
	timer.connect("timeout", self, "PrezZ")
	self.connect("finished", self, "PrezA")
	
	set_process_input(true)

func slides(num):
	if num == 0:
		play("Help")
		snum = 1
	
	elif num == 1:
		play("Player")
		snum = 2
	
	elif num == 2:
		play("Mech")
		snum = 3
	
	elif num == 3:
		play("Rown")
	
	elif num == 4:
		play("Dwig")
	
	elif num == 5:
		PrezM3()
	
	elif num == 6:
		PrezM4()

func PrezA():
	if snum == 3:
		PrezM1()
	
	elif snum == 4:
		PrezM2()

func PrezM1():
	posF = get_node("PrezM1/BallPos").get_global_pos()
	posS = get_node("PrezM1/RowPos").get_global_pos()
	
	nodF = _make_inst(ball, posF)
	gui  = nodF.on_info()
	nodS = _make_inst(rown, posS)
	
	timer.start()

func PrezM2():
	posF = get_node("PrezM2/BallPos").get_global_pos()
	posS = get_node("PrezM2/BoxPos").get_global_pos()
	posT = get_node("PrezM2/DiwgPos").get_global_pos()
	
	nodF = _make_inst(ball, posF)
	nodS = _make_inst(box, posS)
	nodT = _make_inst(dwigm, posT)
	
	gui  = nodT.on_info()
	
	timer.start()

func PrezM3():
	posF = get_node("PrezM3").get_global_pos()
	nodF = _make_inst(spring, posF, false)
	timer.start()

func PrezM4():
	posF = get_node("PrezM4").get_global_pos()
	nodF = _make_inst(chain, posF, false)
	timer.start()

func PrezZ():
	if snum == 3:
		gui.queue_free()
		nodF.queue_free()
		nodS.queue_free()
		snum = 4
	
	elif snum == 4:
		gui.queue_free()
		nodF.queue_free()
		nodS.queue_free()
		nodT.queue_free()
		snum = 5
	
	elif snum == 5:
		nodF.queue_free()
		snum = 6
	
	elif snum == 6:
		nodF.queue_free()
		snum = 0

func _make_inst(obj, pos, bo = true):
	inst = obj.instance()
	inst.set_global_pos(pos)
	inst.set_z(0)
	
	if bo:
		inst.edit_on_ready = false
	
	Globals.get("root").add_child(inst)
	return inst

func _input(event):
	if Input.is_action_pressed("prez"):
		print("try... prez")
		
		if (not is_playing()) or (timer.get_time_left() == 0):
			print("nothihg is playing")
			print("try play " + var2str(snum))
			
			if snum <= lsid:
				slides(snum)
