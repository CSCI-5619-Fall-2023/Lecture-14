extends Node3D

var grabbed_object: RigidBody3D
var previous_position: Vector3
var previous_rotation: Quaternion

# Called when the node enters the scene tree for the first time.
func _ready():
	self.grabbed_object = null
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if self.grabbed_object:
		self.grabbed_object.position += self.position - self.previous_position
		self.grabbed_object.quaternion = self.quaternion * self.previous_rotation.inverse() * self.grabbed_object.quaternion
	
	self.previous_position = self.position
	self.previous_rotation = self.quaternion

func _on_button_pressed(name: String) -> void:
	print("button pressed: " + name)
	
	if name != "grip_click":
		return
	
	var grabbables = get_tree().get_nodes_in_group("grabbable")
	var collision_area = $Area3D as Area3D
	
	for grabbable in grabbables:
		var grabbable_body = grabbable as RigidBody3D
		if self.grabbed_object == null && collision_area.overlaps_body(grabbable_body):
			grabbable_body.freeze_mode = RigidBody3D.FREEZE_MODE_KINEMATIC
			grabbable_body.freeze = true
			self.grabbed_object = grabbable_body
	
func _on_button_released(name: String) -> void:
	print("button released: " + name)
	
	if name != "grip_click":
		return
		
	if self.grabbed_object:
		self.grabbed_object.freeze = false
		self.grabbed_object.gravity_scale = 1
		self.grabbed_object = null
