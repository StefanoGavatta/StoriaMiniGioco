@icon("res://IconGodotNode/node/icon_map.png")
extends StaticBody2D

const torre_alleata = preload("res://torri/torreAlleata.png")
const torre_nemica = preload("res://torri/torreNemica.png")

var vita: int = 500
var danno: int

func _ready() -> void:
	if is_in_group("Nemico"):
		$Sprite2D.flip_h = true
		$Sprite2D.texture = torre_nemica
	else:
		$Sprite2D.texture = torre_alleata

func prendiDanno(danno:int):
	vita -= danno
	aggiornaVita()
	if vita <= 0:
		esplodi()

func esplodi():
	get_tree().reload_current_scene()
	
	#Data : chiama la funzione per compilare il txt
	$"../../Data".componi()
	
	queue_free()

func aggiornaVita():
	$vita.text = str(vita) +"/"+ str(700)
