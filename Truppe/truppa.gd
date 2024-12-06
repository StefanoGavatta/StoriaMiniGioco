extends CharacterBody2D

@export var vita: int = 100
@export var danno: int = 10
@export var velocità: int = 1000
@export var direction: Vector2 

var is_fighting: bool = false
func _ready() -> void:
	#la direction verrà poi successivamente decisa in base 
	#al gruppo di appartenenza idem per lo sxpecchio della
	#sprite, intanto X debug è -1
	direction = Vector2(-1,0)
	
func _physics_process(delta: float) -> void:
	if !is_fighting:
		velocity = direction * velocità * delta
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func prendiDanno(danno:int):
	vita -= danno


func kill():
	queue_free()
