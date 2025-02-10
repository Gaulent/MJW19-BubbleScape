extends Node
class_name StateMachine

@export var initial_state : State

var current_state : State

func _ready():

	# entiendo que esto está con la intencion de que primero se ejecuten las fisicas
	# de los nodos y poder poner un move_and_slide en el general al final
	process_physics_priority = -1

	for child in get_children():
		if child is State:
			child.fsm = self
			child.exit()

	if initial_state:
		current_state = initial_state
		current_state.enter()


func _process(delta):
	current_state.process_state(delta)


func _physics_process(delta):
	current_state.physics_process_state(delta)


func transition_to(new_state_name: NodePath):
	var new_state:State = get_node_or_null(new_state_name)
	if !new_state:
		push_error("FSM: Trying to transition to non existing state: " + str(new_state_name))

	# Clean up the previous state
	if current_state:
		current_state.exit()

	# Intialize the new state
	new_state.enter()
	current_state = new_state
	