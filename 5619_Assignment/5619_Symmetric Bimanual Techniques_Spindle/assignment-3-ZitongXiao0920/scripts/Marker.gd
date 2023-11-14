extends Node3D

var grabbed_object: RigidBody3D = null
var previous_transform: Transform3D
var leftController : XRController3D
var rightController : XRController3D
var initial_distance : float
var up : Vector3 
var use_model_front : bool
var last_scale: Vector3 = Vector3(1.0,1.0,1.0)
var isGrabbedObject : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	leftController = $%LeftController as XRController3D
	rightController = $%RightController as XRController3D
	up = Vector3(0, 1, 0)
	use_model_front = false
	
	if leftController and rightController:
		var midpoint = (leftController.get_position() + rightController.get_position()) / 2.0
		self.position = midpoint
		self.look_at(leftController.get_position(), up, use_model_front)
		
	if self.grabbed_object and isGrabbedObject:
		var distance = rightController.get_position().distance_to(leftController.get_position())
		var rate = (distance / initial_distance)
		var mesh = self.grabbed_object.get_node("MeshInstance3D")
		var collision = self.grabbed_object.get_node("CollisionShape3D")
		mesh.set_scale(last_scale * rate)
		collision.set_scale(last_scale * rate)
		self.grabbed_object.transform = self.global_transform * self.previous_transform.affine_inverse() * self.grabbed_object.transform
	self.previous_transform = self.global_transform


		
func _on_button_pressed(button_name: String) -> void:
	print("button pressed: " + button_name)
	
	# Stop if we have not clicked the grip button or we already are grabbing an object
	if button_name != "grip_click" || self.grabbed_object != null:
		return
	
	var grabbables = get_tree().get_nodes_in_group("grabbable")
	var collision_area = $Area3D as Area3D

	# Iterate through all grabbable objects and check if the collision area overlaps with them
	for grabbable in grabbables:

		# Cast the grabbable object to a RigidBody3D
		var grabbable_body = grabbable as RigidBody3D

		# Check to see if the grabber and grabbable collision shapes are intersecting
		if collision_area.overlaps_body(grabbable_body):
	
			# If the object is already grabbed by another grabber, release it first
			var globals = get_node("/root/Globals")
			for grabber in globals.active_grabbers:
				if grabber.grabbed_object == grabbable_body:
					grabber.grabbed_object = null
					globals.active_grabbers.remove_at(globals.active_grabbers.find(self))
					break

			# Freeze the object physics and then grab it
			grabbable_body.freeze = true
			self.grabbed_object = grabbable_body
			last_scale = self.grabbed_object.find_child("MeshInstance3D").get_scale()
			initial_distance = leftController.get_position().distance_to(rightController.get_position())
			isGrabbedObject = true
			var collisionShape = grabbable_body.get_node("CollisionShape3D") as CollisionShape3D
			collisionShape.disabled = true
	
func _on_button_released(button_name: String) -> void:
	print("button released: " + button_name)
	
	# Stop if we have not clicked the grip button or we have no current grabbed object
	if button_name != "grip_click" || self.grabbed_object == null:
		return

	var collisionShape = self.grabbed_object.get_node("CollisionShape3D") as CollisionShape3D
	collisionShape.disabled = false
	last_scale = self.grabbed_object.find_child("MeshInstance3D").get_scale()
	
	# Release the grabbed object and unfreeze it
	self.grabbed_object.freeze = false
	self.grabbed_object.linear_velocity = Vector3(0, -0.1, 0)
	self.grabbed_object.angular_velocity = Vector3.ZERO
	self.grabbed_object = null
	

	# Remove this grabber from the array of active grabbers
	var globals = get_node("/root/Globals")
	globals.active_grabbers.remove_at(globals.active_grabbers.find(self))
	isGrabbedObject = false
