extends Node

@onready var RayCast: RayCast2D = $"../RayCast2D"

func _physics_process(delta: float) -> void:
	if RayCast.is_colliding():
		if RayCast.get_collider().is_in_group("Nemico"):
			
			abilita_combattimento()

func abilita_combattimento():
	get_parent().is_fighting = true
	
func disabilita_combattimento():
	get_parent().is_fighting = false
