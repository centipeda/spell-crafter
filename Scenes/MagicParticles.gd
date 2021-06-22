extends CPUParticles2D

# we need to keep track of whether the emitter has finished
signal emit_cycle_finished

var emitted_last

func _ready():
    emitted_last = emitting

func _physics_process(_delta):
    var e = emitting
    if emitted_last and not e:
        emit_signal("emit_cycle_finished")
    emitted_last = e
