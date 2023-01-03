extends Area2D

onready var colorRect = get_parent().get_node("CanvasLayer/ColorRect")
onready var audio = get_parent().get_node("AudioStreamPlayer")

func _on_Area2D2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		colorRect.text('The TV says "Breaking news: A suspect arrested for embezzlement."')
