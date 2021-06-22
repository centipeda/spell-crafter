extends Area2D

export(int) var speed = 5

var velocity = Vector2()

func _process(delta):
    
    if Input.is_action_pressed("ui_left"):
        velocity.x = -speed
    elif Input.is_action_pressed("ui_right"):
        velocity.x = speed
    else:
        velocity.x = 0
    
    if Input.is_action_pressed("ui_up"):
        velocity.y = -speed
    elif Input.is_action_pressed("ui_down"):
        velocity.y = speed
    else:
        velocity.y = 0
        
    position += velocity * delta

    if Input.is_action_just_pressed("ui_accept"):
        $Spellcaster.cast_spell(GlobalSpellbook.spell_runes)
    
    if Input.is_action_just_released("ui_accept"):
        $Spellcaster.release_spell()

    look_at(get_global_mouse_position())
