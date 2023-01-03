extends Area2D

onready var colorRect = get_parent().get_node("CanvasLayer/ColorRect")


func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		colorRect.text('Talk to him? (z)')


func _on_Area2D_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		colorRect.visible = false
