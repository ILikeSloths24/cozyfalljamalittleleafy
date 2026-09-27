extends Area2D

func _on_body_entered(body):
	if body.name == "Player":
		collect()

func collect():
	get_tree().current_scene.collect_leaf()
	queue_free()
