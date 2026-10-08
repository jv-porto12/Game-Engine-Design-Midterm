extends CharacterBody2D

enum PlayerState {
	ALIVE,
	DEAD
}

var current_state: PlayerState = PlayerState.ALIVE

@export var speed: float = 10.0
