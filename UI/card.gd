extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var image: Texture
@export var costo: int


func _ready() -> void:
	$TextureRect.texture = image
	


func _mouse_entered() -> void:
	animation_player.play("ingrandimento")

func _mouse_exited() -> void:
	animation_player.play_backwards("ingrandimento")
