extends KinematicBody2D

#Speed Caps
const MAX_SPEED = 400

#Forces
const GRAVITY = 650
const ACCEL = 300
const FRICTION = 1700
const JUMP = 670

#default jump count
var jumps = 1

onready var anim = $AnimatedSprite

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("move_right"):
		if velocity.x < 0:
			velocity.x = move_toward(velocity.x, MAX_SPEED, 2*ACCEL * delta)
		else:
			velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("move_left"):
		if velocity.x > 0:
			velocity.x =  move_toward(velocity.x, -MAX_SPEED, 2*ACCEL * delta)
		else:
			velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL * delta)
		#print(velocity.x)
		anim.play("walk")
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)
		anim.play("idle")
	
	if Input.is_action_just_pressed("jump") and jumps > 0 :
		jumps -= 1
		velocity.y = -JUMP
	if not is_on_floor():
		anim.play("jump")
	if is_on_floor():
		reset_jumps(1)
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity.y += GRAVITY * delta
	velocity=move_and_slide(velocity, Vector2.UP)
	
func reset_jumps(num):
	jumps = num
	
func bounce():
	velocity.y = 0.5*JUMP
func _on_Hurtbox_body_entered(body):
	pass # Replace with function body.
