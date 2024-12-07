@icon("res://IconGodotNode/node/icon_map.png")
extends StaticBody2D

var vita: int = 40
var danno: int


func prendiDanno(danno:int):
	vita -= danno
	print(vita)
	if vita <= 0:
		esplodi()

func esplodi():
	queue_free()
