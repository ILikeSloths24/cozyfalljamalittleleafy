extends Area2D

var player_nearby := false

@onready var exit_prompt: Label = $"../../ExitPrompt"


func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_body_entered(body):
	if body.name == "Player":
		player_nearby = true
		exit_prompt.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_nearby = false
		exit_prompt.visible = false
