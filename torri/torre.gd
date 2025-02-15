
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
	$CollisionShape2D.disabled = true
	var vittoria = true
	if self.is_in_group("Alleato"):
		vittoria = false
	var dati = calcola_punteggio_finale($"../../LanPartyNode".tempoPassato,vittoria)
	$"../..".fine_partita($"../../LanPartyNode".tempoPassato, dati[0], dati[1], vittoria)
	
	queue_free()

func aggiornaVita():
	$vita.text = str(vita) + "/" + str(700)


func calcola_punteggio_finale(tempo:int, vittoria: bool):
	var max_punteggio: int = 5000
	var min_punteggio: int = 2500
	var min_bricoCoin: int = 300
	var max_bricoCoin: int = 600
	
	var punteggio := 0
	var bricoCoin := 0
	if tempo<80 && vittoria:
		for i in range(2):
			aggiungiValore(max_punteggio,max_bricoCoin)
			aggiungiValore(min_punteggio,min_bricoCoin)
	else:
		diminuisciValore(max_punteggio,max_bricoCoin)
		diminuisciValore(min_punteggio,min_bricoCoin)
	
	if vittoria:
		for i in range(3):
			aggiungiValore(max_punteggio,max_bricoCoin)
			aggiungiValore(min_punteggio,min_bricoCoin)
	else:
		for i in range(3):
			diminuisciValore(max_punteggio,max_bricoCoin)
			diminuisciValore(min_punteggio,min_bricoCoin)
			
	if min_bricoCoin<0:
		min_bricoCoin = 0
	
	punteggio = randi_range(min_punteggio,max_punteggio)
	bricoCoin = randi_range(min_bricoCoin,max_bricoCoin)
	return [punteggio, bricoCoin]
func diminuisciValore(punteggio, bricoCoin):
	punteggio -= 1000
	bricoCoin -= 100
func aggiungiValore(punteggio, bricoCoin):
	punteggio += 1000
	bricoCoin += 100
