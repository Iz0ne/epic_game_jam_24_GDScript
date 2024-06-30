extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#var velocity = Vector2.ZERO
	velocity = Vector2(0.0,0.0)
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x += 1
	if Input.is_action_pressed('ui_right'):
		velocity.x -= 1
		
	if velocity.x > 0:
		$AnimationPlayer.play("walkRight")
	elif velocity.x < 0:
		$AnimationPlayer.play("walkLeft")
	elif velocity.y > 0:
		$AnimationPlayer.play("walkDown")
	elif velocity.y < 0:
		$AnimationPlayer.play("walkUp")
	else:
		$AnimationPlayer.play("Standing")
	
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
	

	
	#var xDirection = Input.get_axis("ui_left", "ui_right")
	#velocity.x = xDirection * SPEED
	#
	#var yDirection = Input.get_axis("ui_up", "ui_down")
	#velocity.y = yDirection * SPEED

	print(velocity)
	move_and_slide()
	
	# For IZONE
	#var velocity = Vector2.ZERO
	#if Input.is_action_pressed('ui_up'):
		#velocity.y += 1
	#if Input.is_action_pressed('ui_down'):
		#velocity.y -= 1
	#if Input.is_action_pressed('ui_left'):
		#velocity.x -= 1
	#if Input.is_action_pressed('ui_right'):
		#velocity.x += 1
		#
	#if velocity.length() > 0:
		#velocity = velocity.normalized() * speed
	#
	#position += velocity * delta
	#position.x = clamp(position.x, 32, screen_size.x-32)
	#position.y = clamp(position.y, 32, screen_size.y-32)
