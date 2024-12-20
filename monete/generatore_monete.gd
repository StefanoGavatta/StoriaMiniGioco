@icon("res://IconGodotNode/node_2D/icon_money_bag.png")
extends Node

const moneta = preload("res://monete/coin.tscn")

func _on_timer_timeout() -> void:
	var coin = moneta.instantiate()
	coin.position = Vector2(randi_range(12,1900),-17)
	get_parent().add_child(coin)
