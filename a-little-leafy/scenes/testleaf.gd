extends Area2D

func _ready():
	body_entered.connect(_picked_up)

func _picked_up(body):
	if body is CharacterBody2D:
		print("LEAF PICKED UP")
		queue_free()
