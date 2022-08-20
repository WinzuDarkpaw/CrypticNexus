class_name Player
extends KinematicBody2D

const gravity = 9.8
const speed = 80
const push_speed = 40
const jump_force = -240

var velocity = Vector2.ZERO

# Called 60 times a second.
func _physics_process(delta):
	# On Left Press
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	# On Right Press
	elif Input.is_action_pressed("Right"):
		velocity.x = speed
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	else:
		velocity.x = 0
		$AnimatedSprite.play("Idle")
	
	var slide_count = get_slide_count()
	if slide_count > 0:
		for i in slide_count:
			var collision = get_slide_collision(i)
			print(collision.collider)
			if collision.collider.name == "TileMap":
				check_box_collision(velocity)
	
	# If on floor and Jump pressed
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_force
	
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)

func check_box_collision(motion: Vector2) -> void:
	var box = get_slide_collision(0).collider as PushableBox
	if box:
		box.push(motion)
