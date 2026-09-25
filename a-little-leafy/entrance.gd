extends Area2D

var player_nearby := false

@onready var prompt = $"../EnterPrompt"

func _process(_delta):
	if player_nearby and Input.is_action_just_pressed("interact"):
		print("ENTER HOUSE")

func _on_body_entered(body):
	if body.name == "Player":
		player_nearby = true
		prompt.visible = true

func _on_body_exited(body):
	if body.name == "Player":
		player_nearby = false
		prompt.visible = false
