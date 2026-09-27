extends CharacterBody2D

@export var speed: float = 150.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction := "down"


func update_upgrades():
	# SPEED UPGRADES
	if GameData.leaves_collected >= 3:
		speed = 180.0
	elif GameData.leaves_collected >= 1:
		speed = 165.0
	else:
		speed = 150.0

	# PICKUP RADIUS UPGRADES
	if has_node("LeafPickupRadius/CollisionShape2D"):
		var pickup_shape = $LeafPickupRadius/CollisionShape2D.shape

		if GameData.leaves_collected >= 6:
			pickup_shape.radius = 85.0
		elif GameData.leaves_collected >= 2:
			pickup_shape.radius = 60.0
		else:
			pickup_shape.radius = 30.0
		if GameData.leaves_collected >= 2:
			pickup_shape.radius = 60.0
		else:
			pickup_shape.radius = 30.0

func _physics_process(_delta):
	update_upgrades()

	var direction = Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

	velocity = direction * speed
	move_and_slide()

	if direction != Vector2.ZERO:
		if abs(direction.x) > abs(direction.y):
			if direction.x > 0:
				last_direction = "right"
			else:
				last_direction = "left"
		else:
			if direction.y > 0:
				last_direction = "down"
			else:
				last_direction = "up"

		sprite.play("move_" + last_direction)

	else:
		sprite.stop()
		sprite.frame = 0
