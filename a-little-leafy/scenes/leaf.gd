extends Area2D

var start_y: float
var time: float = 0.0

func _ready():
	start_y = position.y

func _process(delta):
	time += delta
	position.y = start_y + sin(time * 2.5) * 3

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().current_scene.collect_leaf()
		queue_free()
