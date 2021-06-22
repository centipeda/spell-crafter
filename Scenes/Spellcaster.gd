extends Node2D

export(PackedScene) var spell_proto
export(NodePath) var spell_holder

func _ready():
    pass #cast_spell(GlobalSpellbook.spell_runes)

func _process(delta):
    # process launched spells
    for spell in get_node(spell_holder).get_children():
        match spell.state:
            GlobalSpellbook.SPELL_STATE.LAUNCH:
                spell.position += spell._velocity * delta
    print(get_child_count(), " vs ", get_node(spell_holder).get_child_count())

# cast a spell, which is an array of strings which are rune enums
func cast_spell(_spell_runes):
    print("casting ", GlobalSpellbook.spell_runes)
    var spell = spell_proto.instance()
    add_child(spell)
    spell.set_runes(GlobalSpellbook.spell_runes)
    spell.cast()

func release_spell():
    for spell in get_children():
        match spell.state:
            GlobalSpellbook.SPELL_STATE.HOLD:
                print("dispersing")
                remove_child(spell)
                get_node(spell_holder).add_child(spell)
                spell.disperse()
            GlobalSpellbook.SPELL_STATE.HOLD_LAUNCH:
                print("launching")
                _reparent(self, get_node(spell_holder), spell)
                spell.launch(Vector2(1,0).rotated(get_parent().rotation) * spell.speed)
                # spell.rotation = rotation

func _reparent(a, b, n):
    var t = n.global_transform
    a.remove_child(n)
    b.add_child(n)
    n.global_transform = t
    
