extends Area2D

export(int) var speed = 5

var velocity = Vector2()

func _process(delta):
    if not $PlayerSprite.animation == "attack":
        
        if Input.is_action_pressed("ui_left"):
            velocity.x = -speed
            $PlayerSprite.animation = "walk"
            $PlayerSprite.flip_h = true
        elif Input.is_action_pressed("ui_right"):
            velocity.x = speed
            $PlayerSprite.animation = "walk"
            $PlayerSprite.flip_h = false
        else:
            velocity.x = 0
        
        if Input.is_action_pressed("ui_up"):
            velocity.y = -speed
            $PlayerSprite.animation = "walk"
        elif Input.is_action_pressed("ui_down"):
            velocity.y = speed
            $PlayerSprite.animation = "walk"
        else:
            velocity.y = 0
            
        if velocity.x == 0 and velocity.y == 0:            
            $PlayerSprite.animation = "idle"
            
        position += velocity * delta
    
    if Input.is_action_just_pressed("ui_accept"):
        $PlayerSprite.animation = "attack"
        $Spellcaster.cast_spell(GlobalSpellbook.spell_runes)
        
    print($PlayerSprite.animation)


func _on_PlayerSprite_animation_finished():
    if $PlayerSprite.animation == "attack":
        $PlayerSprite.animation = "idle"
