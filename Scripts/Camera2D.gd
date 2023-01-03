extends Camera2D

onready var area2d = get_parent().get_node("Area2D")
onready var tween = get_parent().get_node("Area2D/Tween")
onready var colorRect = get_parent().get_node("CanvasLayer/ColorRect")

var entered = false

func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	entered = true
	if body.name == 'Player':
		tween.interpolate_property(self, 'zoom', self.zoom, Vector2(3, 3), 3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		colorRect.text('This is your friends factory. Enter? (press z)')

func _process(delta):
	if entered == true and Input.get_action_strength('z'):
		get_tree().change_scene("res://Scenes/Factory.tscn")

func _on_Area2D_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	entered = false
