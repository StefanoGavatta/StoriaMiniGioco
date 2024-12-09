@icon("res://IconGodotNode/node/icon_sword.png")
extends Node

#nodo responsabile del combattimento della truppa.
#indica se fermarsi e quanto velocemente attaccare

@onready var RayCast: RayCast2D = $"../RayCast2D"
@onready var timer: Timer = $Timer

@export var hit_rate:float = 2


func _ready() -> void:
	#seleziona quanto veloce colpisce
	timer.wait_time = hit_rate

func _physics_process(delta: float) -> void:
	#abilitatore di combattimento
	if RayCast.is_colliding() && !get_parent().is_fighting:
		abilita_combattimento() #imposta la truppa in modalità combattimento
		attacca() #effettua un primo attacco senza delay
		abilitaTimer() #abilita i successivi attacchi con delay
	elif !RayCast.is_colliding():
		disabilita_combattimento() #se non ha nessuno davanti disabilita la modalità combact

func abilitaTimer():
	timer.start() #fa startare il timer per il signal

func attacca():
	if RayCast.is_colliding():
		RayCast.get_collider().prendiDanno(get_parent().danno) #effettua il danno
		abilitaTimer() # riabilita il danno per il prossimo attacco

func abilita_combattimento():
	get_parent().is_fighting = true

func disabilita_combattimento():
	get_parent().is_fighting = false

func abilita_radar():
	RayCast.enabled = true

func disabilita_radar():
	RayCast.enabled = false
