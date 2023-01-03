extends Sprite

onready var tween = $Tween
onready var tween2 = $Tween2
onready var tween3 = $Tween3

func _ready():
	self.modulate = Color(0, 0, 0)
	tween.interpolate_property(self, 'position', position, Vector2(position.x + 20, position.y), 2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween2.interpolate_property(self, 'modulate', modulate, Color(1, 1, 1), 3, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween3.interpolate_property(self, 'modulate', modulate, Color(1, 1, 1, 0), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	tween2.start()
	yield(get_tree().create_timer(7.0), "timeout")
	tween3.start()
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://Scenes/Investigation.tscn")
