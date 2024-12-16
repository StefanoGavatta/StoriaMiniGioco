@icon("res://IconGodotNode/node/icon_map.png")
extends StaticBody2D

var vita: int = 10000000
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
	queue_free()

func aggiornaVita():
	$vita.text = str(vita) +"/"+ str(10000000)
