extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

@export var nome: String = "Jogador"
@export var esquerda: String = "p1_esquerda"
@export var direita: String = "p1_direita"
@export var pulo: String = "p1_pulo"

@onready var animacao: AnimatedSprite2D = $AnimatedSprite2D
@onready var posicao_inicial = position


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed(pulo) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis(esquerda, direita)
	if direction:
		velocity.x = direction * SPEED
		animacao.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if position.y > 700:
		position = posicao_inicial
		velocity = Vector2.ZERO

	if !is_on_floor():
		animacao.play("jump")
	elif is_on_floor() and velocity.x != 0:
		animacao.play("run")
	else:
		animacao.play("idle")
