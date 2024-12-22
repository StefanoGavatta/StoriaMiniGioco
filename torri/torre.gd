@icon("res://IconGodotNode/node/icon_map.png")
extends StaticBody2D

var vita: int = 1
var danno: int

func _ready() -> void:
	if is_in_group("Nemico"):
		$Sprite2D.flip_h = true

func prendiDanno(danno:int):
	vita -= danno
	aggiornaVita()
	if vita <= 0:
		esplodi()

func esplodi():
	get_tree().paused = true
	queue_free()

func aggiornaVita():
	$vita.text = str(vita) +"/"+ str(700)
