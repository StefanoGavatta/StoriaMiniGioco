@icon("res://IconGodotNode/node_2D/icon_coin.png")

extends Node

const Spada = preload("res://Truppe/truppa.tscn")

var valuta: int= 9999999999999999
@export var capacity: int = 9999999999999999

var istanzeCreate = 0

func _on_valuta_timer_timeout() -> void:
	if valuta<capacity:
		aggiungi_valuta(1)

		
func aggiungi_valuta(quantita: int):
	valuta+=quantita
	aggiornaValore()


func aggiornaValore():
	$"../UI/Label".text = str(valuta)


func ControllaTruppa(card:Card)->bool:
	if card.costo < valuta:
		valuta -= card.costo
		istanziaTruppa(card)
		aggiornaValore()
		return true
	else:
		return false
		#fai qualche effetto strano

func istanziaTruppa(card:Card):
	var posizioni = [$Posizionatore1,$Posizionatore2,$Posizionatore3]
	var istanzaSpada = Spada.instantiate()
	istanzaSpada.add_to_group("Alleato")
	
	istanzaSpada.truppa_identità = card.tipoCarta
	istanzaSpada.vita = card.vita
	print(card.vita)
	istanzaSpada.danno = card.danno
	istanzaSpada.velocità = card.speed
	
	istanzaSpada.position = posizioni.pick_random().position
	if istanzaSpada.position == $Posizionatore1.position:
		istanzaSpada.z_index = 3
	elif istanzaSpada.position == $Posizionatore2.position:
		istanzaSpada.z_index = 2
	elif istanzaSpada.position == $Posizionatore3.position:
		istanzaSpada.z_index = 1
		
	
	get_parent().add_child(istanzaSpada)
	istanzeCreate += 1
	$"../IstanzeCreate".text = str(istanzeCreate)
