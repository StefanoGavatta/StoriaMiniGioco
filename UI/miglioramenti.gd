extends Control

var next_upgrade_capacity = 100
var next_upgrade_production = 100

@onready var gestore_giocatore: Node = %GestoreGiocatore

func _ready() -> void:
	aggiorna_labels()
	$CapacityButton.modulate = Color.WHITE
	$UpgradeButton.modulate = Color.WHITE

func _on_capacity_pressed() -> void:
	if gestore_giocatore.valuta >= next_upgrade_capacity:
		$CapacityButton.play("default")
		gestore_giocatore.valuta -= next_upgrade_capacity
		gestore_giocatore.upgrade_capacity()
		next_upgrade_capacity += 50
		aggiorna_labels()
	else:
		$AnimationPlayer.play("CapacityFondiIns")
func _on_production_pressed() -> void:
	if gestore_giocatore.valuta >= next_upgrade_production:

		if $"../../GestoreGiocatore/ValutaTimer".wait_time >= 0.2:
			gestore_giocatore.valuta -= next_upgrade_production
			gestore_giocatore.upgrade_production()

			next_upgrade_production += 50
			aggiorna_labels()
		else:
			gestore_giocatore.valuta -= next_upgrade_production
			next_upgrade_production = 0
			aggiorna_labels()
		$UpgradeButton.play("default")
	else:
		$AnimationPlayer.play("ProductionFondiIns")
		
func aggiorna_labels():
	$Capacity/costo.text = str(next_upgrade_capacity)
	if next_upgrade_production != 0:
		$Production/costo.text = str(next_upgrade_production)
	else:
		$Production/costo.text = "max"
