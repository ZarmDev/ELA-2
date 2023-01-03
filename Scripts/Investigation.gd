extends Node2D

# This guy is a trickster.
# he tricked people into coming into his house.
# Then he fooled them into helping him in his expirments.
# He wanted to make a cure for science.
# But, he used inncoents

var karmaRangeLow = [['Hello.', 'Welcome to the interview.'], ['You remember me right?', 'We used to be good friends.'], ['Tell me why you did it.', 'Was it our faults or yours.'], ['Besides, why did you steal from that skateboarder?', '... Why did you attack that person?'], ['...What were you gonna do with the money?', 'Who was that person?'], ['Did you hurt him?', 'What did he do to you?'], ['Do you think what you did was bad?', 'Was he such a bad person?'], ['You can stay for a day or two at the police station.', "I'll see what I can do."]]
var ans1 = [['Hi.', 'Thanks.'], ['Of course.', 'Yes, a while ago.'], ["What? Stole from that skateboarder? Turned in friends.", 'What do you think?'], ['For fun. I thought he was too cool.', 'I just wanted to mess with him. I thought it would be funny on tape.'], ['I was gonna give to my grandparents.', 'He was a random person.'], ['No.', 'He was a jerk.'], ['Yes.', 'He hurt me. He wanted to follow me around and annoy me.'], ['You decide.', 'Thanks.']]


var karma = 0

var buttonText = null
var buttonText2 = null

onready var textureButton = $TextureButton
onready var textureButton2 = $TextureButton2
onready var textureButtonText = textureButton.get_node("Label")
onready var textureButtonText2 = textureButton2.get_node("Label")
onready var colorRect = $CanvasLayer/ColorRect

func _ready():
	textureButtonText.text = karmaRangeLow[0][0]
	textureButtonText2.text = karmaRangeLow[0][1]

var questionNum = 0
var questionNum2 = 0

func getKarma(buttonPressed):
	if questionNum == 7:
		colorRect.text("*I think were done here")
		yield(get_tree().create_timer(2.0), "timeout")
		get_tree().change_scene("res://Scenes/Past.tscn")
		return false
	questionNum += 1
	var questionName = null
	var answer = null
	if karma >= 0 and karma < 4:
		questionName = karmaRangeLow[questionNum]
		answer = ans1[questionNum2]
	if buttonPressed == false:
		colorRect.text(answer[0])
		if karma >= 1:
			#karma -= 1
			pass
	else:
		colorRect.text(answer[1])
		#karma += 1
	textureButtonText.text = questionName[0]
	textureButtonText2.text = questionName[1]
	questionNum2 += 1

func _on_TextureButton_pressed():
	getKarma(false)


func _on_TextureButton2_pressed():
	getKarma(true)
