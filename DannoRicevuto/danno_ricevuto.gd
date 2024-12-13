extends Label

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Node = $"../AnimationNode".sprite
@onready var truppa: CharacterBody2D = $".."

var animazione_danno:String
func _ready() -> void:
	$".".visible = false
	
	


func preso_danno(danno:int= 0) -> void:
	text = str(danno)
	animation_player.play("DannoLabel")
