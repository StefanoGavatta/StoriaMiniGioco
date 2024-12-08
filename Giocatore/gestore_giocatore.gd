@icon("res://IconGodotNode/node_2D/icon_coin.png")

extends Node

const Spada = preload("res://Truppe/truppa.tscn")

var valuta: int= 0
var capacity: int = 150

func _on_valuta_timer_timeout() -> void:
	if valuta<capacity:
		valuta+=1
		aggiornaValore()
		
func aggiornaValore():
	$"../UI/Label".text = str(valuta)


func ControllaTruppa(card:Card)->bool:
	if card.costo < valuta:
		valuta -= card.costo
		istanziaTruppa(card.tipoCarta)
		aggiornaValore()
		return true
	else:
	#fai qualche effetto strano
		return false
		

func istanziaTruppa(tipoTruppa:String):
	var posizioni = [$Posizionatore1,$Posizionatore2,$Posizionatore3]
	var istanzaSpada = Spada.instantiate()
	istanzaSpada.position = posizioni.pick_random().position
	istanzaSpada.add_to_group("Alleato")
	get_parent().add_child(istanzaSpada)
