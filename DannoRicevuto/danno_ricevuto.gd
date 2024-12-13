extends Label

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	$".".visible = false

func preso_danno(danno:int= 0) -> void:
	text = str(danno)
	animation_player.play("DannoLabel")
