extends Node2D

export(PackedScene) var spell_proto

# cast a spell, which is an array of strings which are rune enums
func cast_spell(spell_runes):
    var spell = spell_proto.instance()
    spell.set_runes(spell_runes)
    spell.cast()
