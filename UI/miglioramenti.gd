extends Control

var next_upgrade_capacity = 150
var next_upgrade_production = 150

@onready var gestore_giocatore: Node = %GestoreGiocatore

func _ready() -> void:
	aggiorna_labels()


func _on_capacity_pressed() -> void:
	if gestore_giocatore.valuta >= next_upgrade_capacity:
		gestore_giocatore.valuta -= next_upgrade_capacity
		gestore_giocatore.upgrade_capacity()
		next_upgrade_capacity += 50
		aggiorna_labels()
		
func _on_production_pressed() -> void:
	if gestore_giocatore.valuta > next_upgrade_production:
		print("-----------------------")
		print($"../../GestoreGiocatore/ValutaTimer".wait_time)
		if $"../../GestoreGiocatore/ValutaTimer".wait_time >= 0.2:
			gestore_giocatore.valuta -= next_upgrade_production
			gestore_giocatore.upgrade_production()
			print($"../../GestoreGiocatore/ValutaTimer".wait_time)
			print("-----------------------")
			next_upgrade_production += 50
			aggiorna_labels()
		else:
			next_upgrade_production = 0
			aggiorna_labels()

func aggiorna_labels():
	$Capacity/costo.text = str(next_upgrade_capacity)
	if next_upgrade_production != 0:
		$Production/costo.text = str(next_upgrade_production)
	else:
		$Production/costo.text = "max"
