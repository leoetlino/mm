[link_save]: 0x801EF670
[has_completed_intro]: 0x5
[have_tatl]: 0x22
[player_name]: 0x2C
[scene_flags]: 0x470
[scene_record_size]: 0x14
[week_event_reg]: 0xEF8
[scene_flags_ingame]: 0x3F68

[global_context]: 0x803E6B20

[link_actor]: 0x803FFDB0

[starting_exit]: 0x8014533C
[default_save]: 0x801C6898

[link_object_ptr]: 0x803FFFF4

    jr
    nop

/* TODO:
short term:
    shuffle owl loads
    shuffle owl warps
    go to poisoned or clean swamp depending on boss defeated status
    go to frozen or spring mountain depending on boss defeated status
    don't shuffle if cutscene mod is set
    fix death warps so they won't spawn you out of bounds

long term:
    add/fix generic grottos
    make death warps work like in mzx's hack
    make bombers' code etc. a function of the filename (if it isn't already)
    skip giants cutscenes; give oath when any mask is acquired
*/

/* notes:
8016A708    breakpoint hit for reading entrance mod (gets summed immediately after)
then calls 80132338 -> 801322C0
same thing for calling 80132374

80132338 calls 801322C0 and returns the scene number
801322C0 returns the entrance value in V0 (and the pointer to it in V1)
*/

    .word   0xDEADBEEF
// debugging stuff
whatever:
    .word 0
// end of debugging stuff
    .word   0xDEADBEEF

hash:
tunic_color:
    .word   0xFFFFFFFF

.include "crc32.asm"
.include "entrances.asm"

set_scene_flag:
    // a0: scene number
    // a1: scene word (0-4)
    // a2: bit to set (0-31)
    // v0: new scene flag word
    li      t0, @link_save
    addiu   t1, t0, @scene_flags_ingame
    li      t2, @scene_record_size
    multu   a0, t2
    mflo    t2
    addu    t3, t1, t2
    sll     t4, a1, 2 // t4 = a1*sizeof(word)
    addu    t3, t3, t4
    lw      v0, (t3) // load scene flag word
    li      t6, 1
    sllv    t6, t6, a2
    or      v0, v0, t6 // set flag
    jr
    sw      v0, (t3) // write it back

set_event_flag:
    // a0: event flag offset
    // a1: byte offset
    // a2: bit to set (0-7)
    // v0: new event flag value
    li      t0, @link_save
    addu    t1, t0, a0
    addu    t2, t1, a1
    lb      v0, (t2)
    li      t6, 1
    sllv    t6, t6, a2
    or      v0, v0, t6
    jr
    sb      v0, (t2)

tunic_color_hook:
    // copypasta from CloudMax's old hack
    // registers available for use without blowing up: at, t3, t4, a0
    lw      t3, @link_object_ptr
    lui     t4, 0x0001
    sub     t3, t3, t4 // t3 -= 0x10000
    lw      t4, tunic_color
    sw      t4, 0xF184(t3)
    sw      t4, 0xEFFC(t3)
    sw      t4, 0xECB4(t3)
    sw      t4, 0xEB2C(t3)
    sw      t4, 0xE8F4(t3)
    sw      t4, 0xE47C(t3)
    sw      t4, 0xDE74(t3)
    sw      t4, 0xDDB4(t3)
    sw      t4, 0xDBDC(t3)
    sw      t4, 0xD6D4(t3)
    sw      t4, 0xD1AC(t3)
    j       tunic_color_hook_return
    lhu     v0, 0xF6DC(v0) // original code

load_hook:
    push    4, s0, s1, ra
    li      s0, @link_save
    lb      t0, @has_completed_intro(s0)
    bnez    t0, +
    li      t0, 1
    // first time setup
    sb      t0, @has_completed_intro(s0)
    sb      t0, @have_tatl(s0)
    li      a0, 0x0063 // inside clock tower
    li      a1, 1 // second word
    li      a2, 0 // first bit ("You've met with a terrible fate")
    jal     set_scene_flag
    nop
    li      a0, @week_event_reg
    li      a1, 31
    li      a2, 2 // Tatl reminding you about the four directions
    jal     set_event_flag
    nop
+:
    addi    a0, s0, @player_name
    li      a2, 0xFFFFFFFF
    jal     crc32
    li      a1, 8
    not     v0, v0
    sw      v0, hash
    sw      v0, rng_seed
    jal     shuffle_all
    nop
    jpop    4, s0, s1, ra

prng:
    // just a reimplementation of the PRNG the game uses.
    // it's from Numerical Recipes in C, by the way.
    // random = random*0x19660D + 0x3C6EF35F;
    lw      t0, rng_seed
    li      t1, 0x19660D
    multu   t0, t1
    li      t2, 0x3C6EF35F
    mflo    t3
    addu    v0, t3, t2
    sw      v0, rng_seed
    jr
    nop

rng_seed:
    .word   0

randint:
    // v0 = random integer from 0 to a0; a0 >= 0
    push    4, s0, ra, 1
    jal     prng
    addi    s0, a0, 1
    divu    v0, s0
    mfhi    v0
    jpop    4, s0, ra, 1

shuffle_all:
    push    4, s0, s1, s2, ra
    // https://en.wikipedia.org/wiki/Fisher%E2%80%93Yates_shuffle#The_.22inside-out.22_algorithm
    li      s0, 0
    li      s1, @entries
    la      s2, shuffles
-:
    jal     randint
    mov     a0, s0
    // s0 is i, v0 is j
    sll     t0, s0, 2 // 1<<2 == 2*sizeof(half)
    sll     t1, v0, 2 // likewise
    addu    t0, s2, t0 // [i]
    addu    t1, s2, t1 // [j]
    // a[i] = a[j]
    lhu     t3, 2(t1)
    sh      t3, 2(t0)
    // a[j] = source[i]
    lhu     t4, 0(t0)
    sh      t4, 2(t1)
    // iterate
    addi    s0, s0, 1
    bne     s0, s1, -
    nop
+:
    jpop    4, s0, s1, s2, ra

shuffle_exit:
    // a0: exit value
    // v0: shuffled exit value
    push    4, ra
    mov     v0, a0
    li      t0, @entries
    li      t1, 0
    lw      t2, crc32
    sw      t2, rng_seed
    la      t3, shuffles
    mov     t4, t3
-:
    lhu     t5, (t4)
    beq     a0, t5, +
    nop
    addi    t1, t1, 1
    beq     t1, t0, shuffle_exit_return
    nop
    b       -
    addi    t4, t4, 4 // 2*sizeof(halfword)
+:
    lhu     v0, 2(t4)
shuffle_exit_return:
    jpop    4, ra

shuffle_hook:
    push    4, ra
    jal     shuffle_exit
    nop
    mov     a0, v0
    pop     4, ra
    j       shuffle_hook_return
    sw      a0, 0(sp) // original code

.org 0x801322C0
    j       shuffle_hook
    andi    a0, a0, 0xFFFF // original code
shuffle_hook_return:

.org @starting_exit
    li      t8, 0xD800
    li      t4, 0xD800

.org 0x80145464 // JR of starting_exit's function
    j       load_hook // tail call

.org @default_save
    .ascii  "\0\0\0\0\0\0" // ZELDA3
    .half   1 // SoT count
    .ascii  ">>>>>>>>" // player name
    .half   0x30 // hearts
    .half   0x30 // max hearts
    .byte   1 // magic level
    .byte   0x30 // magic amount
    .half   0 // rupees
    .word   0 // navi timer
    .byte   1 // has normal magic
    .byte   0 // has double magic
    .half   0 // double defense
    .half   0xFF00 // unknown
    .half   0x0000 // owls hit
    .word   0xFF000008 // unknown
    .word   0x4DFFFFFF // human buttons
    .word   0x4DFFFFFF // goron buttons
    .word   0x4DFFFFFF // zora buttons
    .word   0xFDFFFFFF // deku buttons
    .word   0x00FFFFFF // equipped slots
    .word   0xFFFFFFFF // unknown
    .word   0xFFFFFFFF // unknown
    .word   0xFFFFFFFF // unknown
    .half   0x0011 // tunic & boots
    .half   0 // unknown
    // inventory items
    .byte   0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF // ocarina, nothing else
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    // mask items
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x32 // deku mask, nothing else
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    .byte   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
    // item quantities
    .byte   0, 0, 0, 0, 0, 0
    .byte   0, 0, 0, 0, 0, 0
    .byte   0, 0, 0, 0, 0, 0
    .byte   0, 0, 0, 0, 0, 0
    //
    .word   0 // upgrades
    .word   0x00003000 // quest status (set song of time and song of healing)

.org 0x801261D0
    j       tunic_color_hook
    lhu     t1, 0x1DB0(t1)// original code
tunic_color_hook_return: