
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
	if distance_to_target() > 1.0:
		if distance_to_target() > 2.0:
			ship.rotate(ship.get_angle_to(target) + 3.1415)  # TODO hardcoded PI
		var path = calculate_path_to_target()
		ship_position.x += path.x * delta
		ship_position.y += path.y * delta
		#if target.x > ship_position.x:
		#	ship_position.x += space_ship_speed * delta
		#if target.x < ship_position.x:
		#	ship_position.x -= space_ship_speed * delta
		#if target.y > ship_position.y:
		#	ship_position.y += space_ship_speed * delta
		#if target.y < ship_position.y:
		#	ship_position.y -= space_ship_speed * delta
	get_node("ship").set_pos(ship_position)

func _input(event):
	if (event.type == InputEvent.MOUSE_BUTTON):
		# var screen_position = get_pos()
		#print(event.global_pos, " ", screen_position)
		target = event.pos

func calculate_path_to_target():
	var s = get_node("ship").get_pos()
	var t = target
	var Dx = t.x - s.x
	var Dy = t.y - s.y
	var S = sqrt(Dx * Dx + Dy * Dy)
	var f = space_ship_speed / S
	return Vector2(f * Dx, f * Dy)
	

func distance_to_target():
	var ship_pos = get_node("ship").get_pos()
	return sqrt((target.x - ship_pos.x) * (target.x - ship_pos.x) + (target.y - ship_pos.y) * (target.y - ship_pos.y))
