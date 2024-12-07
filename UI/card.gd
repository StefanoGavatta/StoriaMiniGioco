extends TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer



func _mouse_entered() -> void:
	animation_player.play("ingrandimento")

func _mouse_exited() -> void:
	animation_player.play_backwards("ingrandimento")
