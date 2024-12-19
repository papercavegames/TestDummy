extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent
@onready var animation_player = $AnimationPlayer
@export var blood_spatter : PackedScene 

var player
var active_level

func _ready():
	active_level = get_tree().current_scene
	
func _process(_delta):
	pass

func _on_health_component_just_hit() -> void:
	if self.position.x > active_level.player.position.x:
		animation_player.play("HitLeft")
	else:
		animation_player.play("HitRight")
	var blood_instance = blood_spatter.instantiate()
	get_parent().call_deferred("add_child", blood_instance)
	blood_instance.position = self.position
	blood_instance.rotation = blood_instance.position.angle_to_point(active_level.player.position) - 135
	
