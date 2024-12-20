@icon("res://IconGodotNode/node_2D/icon_particle.png")
extends Node
@onready var coin: AnimatedSprite2D = $".."
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"

func _process(delta: float) -> void:
	if coin.global_position.y > 616:
		animation_player.play("dissipazione")
