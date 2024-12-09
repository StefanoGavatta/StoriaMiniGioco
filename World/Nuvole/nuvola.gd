extends Sprite2D


var velocità: int = 300

func _process(delta: float) -> void:
	position.x += velocità * delta


func _on_auto_distruzione_timeout() -> void:
	queue_free()
