extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var enemy: CharacterBody2D = $Enemy

func _ready() -> void:
	GameManager.game_state_changed.connect(_on_game_state_changed)
	GameManager.start_game()

func _on_player_died() -> void:
	GameManager.lose_game()


func _on_game_state_changed(new_state: GameManager.GameState) -> void:
	if new_state == GameManager.GameState.WON:
		stop_gameplay()

	elif new_state == GameManager.GameState.LOST:
		stop_gameplay()


func stop_gameplay() -> void:
	player.set_physics_process(false)

	for ghost in get_tree().get_nodes_in_group("ghost"):
		ghost.set_physics_process(false)
	
