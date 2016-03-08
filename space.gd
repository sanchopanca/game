
extends Node2D

var space_ship_speed = 100
var target

func _ready():
	set_process(true)
	set_process_input(true)
	
	target = get_node("ship").get_pos()

func _process(delta):
	var ship = get_node("ship")
	var ship_position = ship.get_pos()
	print(ship_position)
	if Input.is_action_pressed("move_left"):
		ship_position.x -= space_ship_speed * delta
		target = ship_position
	if Input.is_action_pressed("move_right"):
		ship_position.x += space_ship_speed * delta
		target = ship_position
	if Input.is_action_pressed("move_up"):
		ship_position.y -= space_ship_speed * delta
		target = ship_position
	if Input.is_action_pressed("move_down"):
		ship_position.y += space_ship_speed * delta
		target = ship_position
	if ship_position != target:
		
		ship.rotate(ship.get_angle_to(target) + 3.1415)  # TODO hardcoded PI
		if target.x > ship_position.x:
			ship_position.x += space_ship_speed * delta
		if target.x < ship_position.x:
			ship_position.x -= space_ship_speed * delta
		if target.y > ship_position.y:
			ship_position.y += space_ship_speed * delta
		if target.y < ship_position.y:
			ship_position.y -= space_ship_speed * delta
	get_node("ship").set_pos(ship_position)

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON):
		# var screen_position = get_pos()
		#print(event.global_pos, " ", screen_position)
		target = event.pos
