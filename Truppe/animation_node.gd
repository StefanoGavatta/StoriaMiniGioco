@icon("res://IconGodotNode/node/icon_brush.png")
extends Node

@onready var truppa: CharacterBody2D = $".."
var movimento: String = "movement_blu"
var attacco: String = "attack_blu"
var idle: String = "idle_blu"
var death: String = "death_blu"
var sprite: AnimatedSprite2D
var is_attacking: bool = false

func _ready() -> void:
	sprite = $"../AssemblatoreGruppo".elimina_animation(truppa.truppa_identità)
	if truppa.is_in_group("Nemico"):
		movimento = "movement_red"
		attacco = "attack_red"
		idle = "idle_red"
		death = "death_red"

func _process(delta: float) -> void:
	# Solo gestisci l'animazione se non si sta già attaccando
	if truppa.can_move && not is_attacking:
		if truppa.velocity.x != 0:
			sprite.play(movimento)
		else:
			sprite.play(idle)

func attacco_signal() -> void:
	if not is_attacking && $"../RayCast2D".is_colliding() && truppa.can_move:
		is_attacking = true
		sprite.play(attacco)
		print("playato attacco")
		await sprite.animation_finished
		is_attacking = false


func _on_truppa_death() -> void:
	truppa.can_move = false
	$"../CollisionShape2D".queue_free()
	sprite.play(death)
	await sprite.animation_finished
	truppa.queue_free()
