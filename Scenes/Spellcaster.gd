extends Node2D

export(PackedScene) var spell_proto

# cast a spell, which is an array of strings which are rune names
func cast_spell(spell_runes):
    var spell = spell_proto.instance()
    spell.init(spell_runes)
    spell.cast()
