@icon("res://IconGodotNode/node/icon_target_2.png")
extends Node

@onready var knock_back: Timer = $KnockBack
@onready var truppa: CharacterBody2D = $".."
@onready var fight_node: Node = $"../FightNode"

var contatore = 0
var random_KnockBack_success = randi_range(3,8)
func KnockBack():
	fight_node.disabilita_combattimento()
	fight_node.disabilita_radar()
	knock_back.start()
	truppa.direction = -truppa.direction
	await knock_back.timeout
	truppa.direction = -truppa.direction
	fight_node.abilita_radar()

func _on_truppa_preso_danno(danno:int) -> void:
	contatore+=1
	if contatore >= random_KnockBack_success:
		KnockBack()
		random_KnockBack_success = randi_range(2,5)
		contatore = 0
