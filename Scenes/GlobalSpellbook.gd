extends Node

enum RUNE {
    NULL,
    GATHER,
    DISPERSE,
    TRANSMUTE_FLAME,
    TRANSMUTE_WATER,
    TRANSMUTE_EARTH,
    TRANSMUTE_WIND,
     }

enum ELEMENT {
    PURE,
    FLAME,
    EARTH,
    WATER,
    WIND
   }

enum SHAPE {
    NONE,
    SPHERE,
    LANCE,
    WALL
   }

const RUNE_NAME = {
    RUNE.NULL : "Nothingness",
    RUNE.GATHER : "Gathering",
    RUNE.DISPERSE : "Dispersal",
    RUNE.TRANSMUTE_FLAME : "Flame Transmutation",
    RUNE.TRANSMUTE_WATER : "Water Transmutation",
    RUNE.TRANSMUTE_EARTH : "Earth Transmutation",
    RUNE.TRANSMUTE_WIND : "Wind Transmutation"
   }

const RUNE_IMG = {
    RUNE.NULL : "runes/TestRune2.png",
    RUNE.GATHER : "runes/runes_Gathering.png",
    RUNE.DISPERSE : "runes/Runes_Dispersal.png",
    RUNE.TRANSMUTE_FLAME : "runes/runes_FlameTransmutation.png",
    RUNE.TRANSMUTE_WATER : "runes/runes_Transmutation.png",
    RUNE.TRANSMUTE_EARTH : "runes/runes_Transmutation.png",
    RUNE.TRANSMUTE_WIND : "runes/runes_Transmutation.png",
   }

var spell_runes = []
