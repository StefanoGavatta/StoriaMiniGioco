@icon("res://download.png")
extends StaticBody2D

var vita: int = 40
var danno: int

var produzione: float
var capienza: int

@onready var timer: Timer = $Produzione



func prendiDanno(danno:int):
	vita -= danno
	print(vita)
	if vita <= 0:
		esplodi()

func esplodi():
	queue_free()
