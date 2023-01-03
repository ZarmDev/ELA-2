extends Node2D

onready var audiostream = $AudioStreamPlayer

func _ready():
	audiostream.playing = true
