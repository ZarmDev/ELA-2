extends ColorRect

onready var tween = $Tween
onready var tween2 = $Tween2
onready var tween3 = $Tween3
onready var elevator = get_parent().get_parent().get_node("Area2D2/U")
onready var player = get_parent().get_parent().get_node("Player")

func _ready():
		self.visible = true
		self.color = Color(0, 0, 0, 1)
		tween.interpolate_property(self, 'color', color, Color(0, 0, 0, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		yield(get_tree().create_timer(1.0), "timeout")
		self.visible = false



func _on_Area2D2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.name == 'Player':
		tween2.interpolate_property(elevator, 'position', elevator.position, Vector2(elevator.position.x, elevator.position.y + 1000), 10, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween2.start()
		tween3.interpolate_property(player, 'position', player.position, Vector2(player.position.x, player.position.y + 1000), 10, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		yield(get_tree().create_timer(10.0), "timeout")
		self.visible = true
		self.color = Color(0, 0, 0, 0)
		tween.interpolate_property(self, 'color', color, Color(0, 0, 0, 1), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
		tween.start()
		yield(get_tree().create_timer(1.0), "timeout")
		get_tree().change_scene("res://Scenes/top.tscn")
