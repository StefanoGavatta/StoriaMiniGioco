
extends StaticBody2D

const torre_alleata = preload("res://torri/Sprite_TowerBLUE.png")
const torre_nemica = preload("res://torri/Sprite_TowerRED.png")

var vita: int = 500
var danno: int

#------scuotimento------
var shake_intensity = 0.0  
var shake_duration = 0.0  
var shake_timer = 0.0
var shake_offset = Vector2.ZERO  

@onready var pos_init = global_position  

func _ready() -> void:
	if is_in_group("Nemico"):
		$Sprite2D.flip_h = true
		$Sprite2D.texture = torre_nemica
	else:
		$Sprite2D.texture = torre_alleata


func _process(delta: float) -> void:
	if shake_timer < shake_duration:
		shake_timer += delta
		var progress = shake_timer / shake_duration
		var current_intensity = shake_intensity * (1.0 - progress)
		shake_offset = Vector2(randf_range(-current_intensity, current_intensity),randf_range(-current_intensity, current_intensity))
	else:
		shake_offset = Vector2.ZERO  
	global_position = pos_init + shake_offset


func prendiDanno(danno: int):
	shake_intensity = 10.0  
	shake_duration = 0.2 
	shake_timer = 0.0

	vita -= danno
	aggiornaVita()
	if vita <= 0:
		esplodi()

func esplodi():
	get_tree().reload_current_scene()

	queue_free()

func aggiornaVita():
	$vita.text = str(vita) + "/" + str(700)
