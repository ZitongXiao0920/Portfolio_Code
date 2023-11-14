extends Node3D

var leftController : XRController3D
var rightController : XRController3D
var up : Vector3 
var use_model_front : bool
var distance : Vector3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	leftController = $%LeftController as XRController3D
	rightController = $%RightController as XRController3D
	up = Vector3(0, 1, 0)
	use_model_front = false
	var midpoint = (leftController.get_position() + rightController.get_position()) / 2.0
	self.position = midpoint
	self.look_at(leftController.get_position(), up, use_model_front)
	distance = leftController.position - rightController.position
	var scaleValue = sqrt((distance.x) * (distance.x) + (distance.y) * (distance.y) + (distance.z) * (distance.z))
	self.scale = Vector3(1.0, 1.0, scaleValue)
	
