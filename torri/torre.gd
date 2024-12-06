@icon("res://download.png")
extends StaticBody2D

var vita: int
var danno: int

var produzione: float
var capienza: int

@onready var timer: Timer = $Produzione



func prendi_danno(danno: int):
	vita-= danno
	if vita <= 0:
		esplodi()

func esplodi():
	print("esploso")
