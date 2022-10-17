class_name Player
extends KinematicBody2D

const gravity = 9.8
const speed = 160
const push_speed = 80
const jump_force = -400
var velocity = Vector2.ZERO

func _physics_process(delta):
	handle_controls(Input)
	handle_collisions()
	apply_force()

func handle_controls(input: Input) -> void:
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	# On Right Press
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	else:
		velocity.x = 0
		$AnimatedSprite.play("Idle")
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_force

func apply_force() -> void:
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)

func handle_collisions() -> void:
	var slide_count = get_slide_count()
	if slide_count > 0:
		for i in slide_count:
			var collision = get_slide_collision(i)
			if collision.collider.name == "TileMap":
				check_box_collision(velocity)

func check_box_collision(motion: Vector2) -> void:
	var box = get_slide_collision(0).collider as RiddleBox
	if box:
		box.push(motion)
