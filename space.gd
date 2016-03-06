
extends Node2D

var space_ship_speed = 100

func _ready():
	set_process(true)

func _process(delta):
	var ship_position = get_node("ship").get_pos()
	if Input.is_action_pressed("move_left"):
		ship_position.x -= space_ship_speed * delta
	if Input.is_action_pressed("move_right"):
		ship_position.x += space_ship_speed * delta
	if Input.is_action_pressed("move_up"):
		ship_position.y -= space_ship_speed * delta
	if Input.is_action_pressed("move_down"):
		ship_position.y += space_ship_speed * delta
		
	get_node("ship").set_pos(ship_position)
