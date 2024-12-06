extends Node

@onready var RayCast: RayCast2D = $"../RayCast2D"
@onready var timer: Timer = $Timer

@export var hit_rate:float = 2

func _ready() -> void:
	timer.wait_time = hit_rate

func _physics_process(delta: float) -> void:
	if RayCast.is_colliding() && !get_parent().is_fighting:
		if RayCast.get_collider().is_in_group("Nemico"):
			abilita_combattimento()
			attacca()
			abilitaTimer()
	elif !RayCast.is_colliding():
		disabilita_combattimento()

func abilitaTimer():
	timer.start()

func attacca():
	if RayCast.is_colliding():
		RayCast.get_collider().prendiDanno(get_parent().danno)
		abilitaTimer()

func abilita_combattimento():
	get_parent().is_fighting = true

func disabilita_combattimento():
	get_parent().is_fighting = false
