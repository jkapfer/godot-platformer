extends KinematicBody2D

#Speed Caps
const MAX_SPEED = 500

#Forces
const GRAVITY = 1100
const ACCEL = 500
const FRICTION = 1200
const JUMP = 650

#default jump count
var jumps = 1

onready var anim = $AnimatedSprite

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("idle")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		if velocity.x < 0:
			velocity.x = move_toward(velocity.x, MAX_SPEED, 2*ACCEL * delta)
		else:
			velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL * delta)
		print(velocity.x)
		anim.play("walk")
		anim.flip_h = false
	elif Input.is_action_pressed("ui_left"):
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
	
	if Input.is_action_just_pressed("ui_select") and jumps > 0 :
		jumps -= 1
		velocity.y = -JUMP
	if not is_on_floor():
		anim.play("jump")
	if is_on_floor():
		reset_jumps(1)
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity=move_and_slide(velocity, Vector2.UP)
	
	
func reset_jumps(num):
	jumps = num
