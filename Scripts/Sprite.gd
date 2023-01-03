extends Sprite


onready var tween = $Tween

func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		body.visible = false
		self.flip_h = true
		tween.interpolate_property(self, 'position', position, Vector2(position.x + 100, position.y), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		yield(get_tree().create_timer(4.0),"timeout")
		get_tree().change_scene("res://Scenes/Cityscape.tscn")
