@icon("res://IconGodotNode/node/icon_brush.png")
extends Node

@onready var truppa: CharacterBody2D = $".."

var movimento: String = "movement_red"
var attacco: String = "attack_red"
var idle: String = "idle_red"
var death: String = "death_red"



func _ready() -> void:
	if truppa.is_in_group("Nemico"):
		movimento = "movement_red"
		attacco = "attack_red"
		idle = "idle_red"
		death = "death_red"
