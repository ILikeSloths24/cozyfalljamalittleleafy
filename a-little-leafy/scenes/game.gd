extends Node2D

var total_leaves: int = 5

@onready var leaf_counter = $CanvasLayer/CounterBox/LeafCounter
@onready var timer_label = $CanvasLayer/TextureRect/TimerLabel
@onready var next_milestone = $CanvasLayer/NextMilestoneBox/NextMilestone


func _ready():
	update_counter()


func _process(_delta):
	var total_seconds = int(GameData.game_time)
	var minutes = total_seconds / 60
	var seconds = total_seconds % 60

	timer_label.text = "%02d:%02d" % [minutes, seconds]


func collect_leaf():
	GameData.leaves_collected += 1
	update_counter()

	if GameData.leaves_collected == 1:
		show_milestone(
			"MILESTONE REACHED!\n1 LEAF\nMovement Speed Increased!"
		)

	elif GameData.leaves_collected == 2:
		show_milestone(
			"MILESTONE REACHED!\n2 LEAVES\nLeaf Pickup Radius Increased!"
		)

	elif GameData.leaves_collected == 3:
		show_milestone(
			"MILESTONE REACHED!\n3 LEAVES\nMovement Speed Increased!"
		)

	elif GameData.leaves_collected == 5:
		show_milestone(
			"MILESTONE REACHED!\n5 LEAVES\nLeaf Pickup Radius Increased!"
		)


func update_counter():
	leaf_counter.text = "Leaves: " + str(GameData.leaves_collected) + " / " + str(total_leaves)
	update_next_milestone()


func show_milestone(message: String):
	var box = $CanvasLayer/MilestoneBox
	var label = $CanvasLayer/MilestoneBox/MilestonePopup

	label.text = message
	box.visible = true

	await get_tree().create_timer(3.0).timeout

	box.visible = false


func update_next_milestone():
	var leaves = GameData.leaves_collected
	var next_goal = 0

	if leaves < 1:
		next_goal = 1
	elif leaves < 2:
		next_goal = 2
	elif leaves < 3:
		next_goal = 3
	elif leaves < 5:
		next_goal = 5
	else:
		next_milestone.text = "All milestones reached!"
		return

	var remaining = next_goal - leaves
	next_milestone.text = str(remaining) + " till next milestone"
