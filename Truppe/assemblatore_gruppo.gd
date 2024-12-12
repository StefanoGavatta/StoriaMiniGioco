@icon("res://IconGodotNode/node/icon_magnifier.png")
extends Node

#nodo che seleziona in base al gruppo di appartenenza quali tipi di valori assegnare
#alla truppa
#si autoDistrugge alla fine

@onready var RayCast: RayCast2D = $"../RayCast2D"
@onready var Sprite: Sprite2D = $"../Sprite2D"
@onready var posizione_nemico: Marker2D = $PosizioneNemico
@onready var posizione_alleato: Marker2D = $PosizioneAlleato
@onready var truppa: CharacterBody2D = $".."

func _ready() -> void:

	truppa.GruppoAvversario.call()
	if get_parent().is_in_group("Nemico"):
		truppa.direction = Vector2(1,0)
		RayCast.position = posizione_nemico.position
		Sprite.flip_h = true
		RayCast.rotation = deg_to_rad(180)
		truppa.set_collision_layer_value(8,true)
		RayCast.set_collision_mask_value(7,true)
	else:
		truppa.direction = Vector2(-1,0)
		RayCast.rotation = deg_to_rad(0)
		RayCast.position = posizione_alleato.position
		Sprite.flip_h = false
		truppa.set_collision_layer_value(7,true)
		RayCast.set_collision_mask_value(8,true)
	$"..".scale = Vector2(1.35,1.35)
	queue_free()
