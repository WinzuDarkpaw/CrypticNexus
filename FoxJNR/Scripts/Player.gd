class_name Player
extends KinematicBody2D

# Behandelt das physische Verhalten des Spielercharakters.

# Gravitation.
const gravity = 9.8

# Bewegungsgeschwindigkeit.
const speed = 80

# Bewegungsgeschwindigkeit beim Verschieben von Gegenständen.
const push_speed = 40

# Sprungkraft. (Negative Sprungkraft = Hoch)
const jump_force = -240

# Aktuelle Geschwindigkeit.
var velocity = Vector2.ZERO

func _physics_process(delta):
	#print(Engine.get_frames_per_second())
	handle_controls(Input)
	handle_collisions()
	apply_force()

# Behandelt die Steuerung des Spielers.
# Hier werden Events behandelt und dementsprechend Aktionen folgen
# wie z.B. Geschwindigkeit und Animationen.
func handle_controls(input: Input) -> void:
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
	
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_force

# Behandelt die Physischen Kräfte des Spielercharakters.
# Wie z.B. Gravitation.
# move_and_slide wird hier aufgerufen.
func apply_force() -> void:
	velocity.y += gravity
	velocity = move_and_slide(velocity, Vector2.UP)

# Fragt konstant die Kollisionen mit bestimmten Objekten ab.
# Dies ist wichtig für den richtigen Umgang mit Objekten in der Welt.
func handle_collisions() -> void:
	var slide_count = get_slide_count()
	if slide_count > 0:
		for i in slide_count:
			var collision = get_slide_collision(i)
			if collision.collider.name == "TileMap":
				check_box_collision(velocity)

# Überprüft ob eine Kollision mit einer PushableBox gegeben ist.
func check_box_collision(motion: Vector2) -> void:
	var box = get_slide_collision(0).collider as PushableBox
	if box:
		box.push(motion)
