extends Area2D

var life
var points

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	life = get_node("../Player").life
	points = get_node("../Player").points


func _on_Coin_body_entered(body):
	if (body.get_name() == "Player"):
		if (self.is_visible_in_tree()):
			hide()
			# points += 1
			get_node("../Player").points += 1
			get_node("../LifeCounterPlayer").text = str("Lives: ",life, " Points: ", get_node("../Player").points)
			$CollectingSound.volume_db = 10
			if ($CollectingSound.playing == false):
					$CollectingSound.play()
