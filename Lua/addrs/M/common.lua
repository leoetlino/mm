-- version-agnostic addresses
function Actor(addr)
    local function AA(a, s) return A(addr+a, s) end
    return {
        num             = AA(0x0, 2),
        type            = AA(0x2, 1),
        room_number     = AA(0x3, 1), -- -1 = always loaded
        flags           = AA(0x4, 4),
        x_copy          = AA(0x8, 'f'),
        y_copy          = AA(0xC, 'f'),
        z_copy          = AA(0x10, 'f'),
        x_rot_init      = AA(0x14, 2), -- verify somehow?
        y_rot_init      = AA(0x16, 2),
        z_rot_init      = AA(0x18, 2),
        unk_1A          = AA(0x1A, 2), -- padding?
        var             = AA(0x1C, 2),
        unk_1E          = AA(0x1E, 1), -- actor type? set to -1 to unload actor
        unk_1F          = AA(0x1F, 1), -- link: 0x03
        unk_20          = AA(0x20, 4), -- link: 0x03FF
        unk_22          = AA(0x22, 2),
        x               = AA(0x24, 'f'),
        y               = AA(0x28, 'f'),
        z               = AA(0x2C, 'f'),
        unnamed_x_rot   = AA(0x30, 2), -- LERPed model facing angle?
        unnamed_y_rot   = AA(0x32, 2),
        unnamed_z_rot   = AA(0x34, 2), -- unused?
        unk_36          = AA(0x36, 2), -- padding?
        unk_38          = AA(0x38, 1), -- enum? whether owls can be hit?
        unk_39          = AA(0x39, 1),
        unk_3A          = AA(0x3A, 2),
        target_x        = AA(0x3C, 'f'), -- for z-targeting
        target_y        = AA(0x40, 'f'),
        target_z        = AA(0x44, 'f'),
        fps_vert_angle  = AA(0x48, 2),
        fps_horiz_angle = AA(0x4A, 2),
        fps_unk_angle   = AA(0x4C, 2),
        unk_4E          = AA(0x4E, 2), -- padding?
        unk_50          = AA(0x50, 2), -- automatically resets to 0?
        unk_52          = AA(0x52, 2),
        unk_54          = AA(0x54, 'f'), -- link: 500.0
        x_scale         = AA(0x58, 'f'),
        y_scale         = AA(0x5C, 'f'),
        z_scale         = AA(0x60, 'f'),
        x_vel           = AA(0x64, 'f'),
        y_vel           = AA(0x68, 'f'),
        z_vel           = AA(0x6C, 'f'),
        lin_vel_old     = AA(0x70, 'f'),
        unk_74          = AA(0x74, 'f'), -- an offset perhaps?
        unk_78          = AA(0x78, 'f'),
        unk_7C          = AA(0x7C, 4),
        unk_80          = AA(0x80, 4), -- pointer to ground?
        unk_84          = AA(0x84, 4),
        ground_y        = AA(0x88, 'f'),
        unk_8C          = AA(0x8C, 4),
        unk_90          = AA(0x90, 4), -- collision flags?
        unk_94          = AA(0x94, 4),
        unk_98          = AA(0x98, 4),
        unk_9C          = AA(0x9C, 4),
        damage_table    = AA(0xA0, 4),
        unk_A4          = AA(0xA4, 4),
        unk_A8          = AA(0xA8, 4),
        unk_AC          = AA(0xAC, 4),
        unk_B0          = AA(0xB0, 4),
        unk_B4          = AA(0xB4, 1),
        unk_B5          = AA(0xB5, 1),
        unk_B6          = AA(0xB6, 1),
        hp              = AA(0xB7, 1),
        unk_B8          = AA(0xB8, 4),
        unk_BC          = AA(0xBC, 2),
        angle           = AA(0xBE, 2), -- part of rotation struct?
        unk_C0          = AA(0xC0, 4), -- enum?
        unk_C4          = AA(0xC4, 'f'), -- float?
        unk_C8          = AA(0xC8, 4), -- pointer?
        unk_CC          = AA(0xCC, 'f'), -- float?
        unk_D0          = AA(0xD0, 1), -- single byte?
        unk_D1          = AA(0xD1, 1), -- single byte?
        unk_D2          = AA(0xD2, 1), -- single byte?
        unk_D3          = AA(0xD3, 1), -- single byte?
        foot_left_x     = AA(0xD4, 'f'), -- tested on Link, may be other things
        foot_left_y     = AA(0xD8, 'f'),
        foot_left_z     = AA(0xDC, 'f'),
        foot_right_x    = AA(0xE0, 'f'), -- tested on Link, may be other things
        foot_right_y    = AA(0xE4, 'f'),
        foot_right_z    = AA(0xE8, 'f'),
        camera_rel_x    = AA(0xEC, 'f'),
        camera_rel_y    = AA(0xF0, 'f'),
        camera_rel_z    = AA(0xF4, 'f'),
        unknown_z       = AA(0xF8, 'f'),
        unk_FC          = AA(0xFC, 4),
        unk_100         = AA(0x100, 4),
        unk_104         = AA(0x104, 4),
        x_old           = AA(0x108, 'f'),
        y_old           = AA(0x10C, 'f'),
        z_old           = AA(0x110, 'f'),
        -- somewhere in here is u8 runActor?
        prev            = AA(0x128, 4),
        next            = AA(0x12C, 4),
    }
end

return {
    link                = A(link, 0x4000),
    exit_value          = AL(0x02, 2),
    mask_worn           = AL(0x04, 1),
    intro_completed     = AL(0x05, 1),
    cutscene_status     = AL(0x0A, 2),
    time                = AL(0x0C, 2),
    owl_id              = AL(0x0E, 2),
    day_night           = AL(0x10, 4),
    time_speed          = AL(0x14, 4),
    day                 = AL(0x18, 4),
    day_again           = AL(0x1C, 4),
    transformation      = AL(0x20, 1),
    owl_save            = AL(0x23, 1), -- "zeroth day" effect
    ZELDA3              = AL(0x24, 6),
    sot_count           = AL(0x2A, 2),
    name                = AL(0x2C, 8),
    max_hearts          = AL(0x34, 2),
    hearts              = AL(0x36, 2),
    magic_level         = AL(0x38, 1),
    magic               = AL(0x39, 1),
    rupees              = AL(0x3A, 2),
    navi_timer          = AL(0x3C, 4), -- ?
    has_normal_magic    = AL(0x40, 1),
    has_double_magic    = AL(0x41, 1),
    owls_hit            = AL(0x46, 2),
    sword_shield        = AL(0x6D, 1),
    inventory_items     = AL(0x70, 24),
    inventory_masks     = AL(0x88, 24),
    inventory_quantities= AL(0xA0, 24),
    upgrades            = AL(0xB8, 4),
    quest_items         = AL(0xBC, 4),
    items_wft           = AL(0xC0, 1),
    items_sht           = AL(0xC1, 1),
    items_gbt           = AL(0xC2, 1),
    items_stt           = AL(0xC3, 1),
    keys_wft            = AL(0xCA, 1),
    keys_sht            = AL(0xCB, 1),
    keys_gbt            = AL(0xCC, 1),
    keys_stt            = AL(0xCD, 1),
    doubled_hearts      = AL(0xD3, 1), -- set to 20 by the game
    fairies_wft         = AL(0xD4, 1),
    fairies_sht         = AL(0xD5, 1),
    fairies_gbt         = AL(0xD6, 1),
    fairies_stt         = AL(0xD7, 1),
    strange_string      = AL(0xDE, 6),
    scene_flags_save    = AL(0x470, 0x960),
  --clock_town_map      = AL(0xEB2, 1),
    slulltula_count_wf  = AL(0xEC0, 2),
    slulltula_count_gb  = AL(0xEC2, 2),
    banked_rupees       = AL(0xEDE, 2),
    week_event_reg      = AL(0xEF8, 100),
    archery             = AL(0xF00, 1),
    chateau_romani      = AL(0xF06, 1), -- 8
    disable_c_buttons   = AL(0xF4A, 1), -- 8
    sword_disable_c     = AL(0xF52, 1), -- 32
    map_visited         = AL(0xF5E, 2),
    map_visible         = AL(0xF62, 2),
    bombers_caught      = AL(0xFE6, 1),

    bombers_order = {
        AL(0xFE7, 1),
        AL(0xFE8, 1),
        AL(0xFE9, 1),
        AL(0xFEA, 1),
        AL(0xFEB, 1),
    },
    lottery_numbers = {
        AL(0xFEC, 3),
        AL(0xFEF, 3),
        AL(0xFF2, 3),
    },
    spider_mask_order = {
        AL(0xFF5, 1), -- 0: red; 1: blue; 2: green; 3: yellow
        AL(0xFF6, 1),
        AL(0xFF7, 1),
        AL(0xFF8, 1),
        AL(0xFF9, 1),
        AL(0xFFA, 1),
    },
    bombers_code = {
        AL(0xFFB, 1),
        AL(0xFFC, 1),
        AL(0xFFD, 1),
        AL(0xFFE, 1),
        AL(0xFFF, 1),
    },

    -- note: these addresses are invalid for JP10, JP11.
    checksum            = AL(0x100A, 2),
    event_inf           = AL(0x100C, 8),
    disable_pause       = AL(0x100D, 1),
    hookshot_ba         = AL(0x100E, 1),
    disable_c_buttons_2 = AL(0x100F, 1),
    disable_items       = AL(0x1010, 1),
    rock_sirloin        = AL(0x1014, 1),
    b_button_disabler   = AL(0x1015, 1), -- ?
    bubble_timer        = AL(0x1016, 2),
    rupee_accumulator   = AL(0x1018, 2),
    spring_water_timers = AL(0x1020, 0xC0),
    pictograph_picture  = AL(0x10E0, 0x2BC0),
    current_save        = AL(0x3CA0, 4),
    title_screen_mod    = AL(0x3CA8, 4),
    entrance_mod        = AL(0x3CAC, 4),
    dog_spanwer         = AL(0x3DBC, 2),
    timer_crap          = AL(0x3DD0, 4),
    postman_timer       = AL(0x3DE4, 4), -- minigame
    majora_timer        = AL(0x3DFC, 4), -- atop clock tower?
    minigame_timer      = AL(0x3E04, 4),
    drown_timer         = AL(0x3E0C, 4),
    timer_x             = AL(0x3EFA, 2),
    timer_y             = AL(0x3F08, 2),
    buttons_enabled     = AL(0x3F18, 4),
    magic_modifier      = AL(0x3F28, 4),
    magic_max           = AL(0x3F2E, 2),
    weird_a_graphic     = AL(0x3F42, 1),
    target_style        = AL(0x3F45, 1),
    music_mod           = AL(0x3F46, 2),
    entrance_mod_setter = AL(0x3F4A, 2),
    title_screen_thing  = AL(0x3F4C, 1),
    transition_mod      = AL(0x3F55, 2),
    suns_song_effect    = AL(0x3F58, 2),
    health_mod          = AL(0x3F5A, 2),
    screen_scale_enable = AL(0x3F60, 1),
    screen_scale        = AL(0x3F64, 'f'),
    scene_flags_ingame  = AL(0x3F68, 0x960),

    inventory = {
        b_button_item   = AL(0x4C, 1),
        c_left_item     = AL(0x4D, 1),
        c_down_item     = AL(0x4E, 1),
        c_right_item    = AL(0x4F, 1),
        b_button_goron  = AL(0x50, 1),
        b_button_zora   = AL(0x54, 1),
        b_button_deku   = AL(0x58, 1),
        b_button_slot   = AL(0x5C, 1), -- unused?
        c_left_slot     = AL(0x5D, 1),
        c_down_slot     = AL(0x5E, 1),
        c_right_slot    = AL(0x5F, 1),

        ocarina         = AL(0x70, 1),
        bow             = AL(0x71, 1),
        fire_arrows     = AL(0x72, 1),
        ice_arrows      = AL(0x73, 1),
        light_arrows    = AL(0x74, 1),
        event_1         = AL(0x75, 1),
        bombs           = AL(0x76, 1),
        bombchu         = AL(0x77, 1),
        deku_stick      = AL(0x78, 1),
        deku_nut        = AL(0x79, 1),
        magic_beans     = AL(0x7A, 1),
        event_2         = AL(0x7B, 1),
        powder_keg      = AL(0x7C, 1),
        pictograph      = AL(0x7D, 1),
        lens_of_truth   = AL(0x7E, 1),
        hookshot        = AL(0x7F, 1),
        fairy_sword     = AL(0x80, 1),
        event_3         = AL(0x81, 1),
        bottle_1        = AL(0x82, 1),
        bottle_2        = AL(0x83, 1),
        bottle_3        = AL(0x84, 1),
        bottle_4        = AL(0x85, 1),
        bottle_5        = AL(0x86, 1),
        bottle_6        = AL(0x87, 1),
    },
    masks = {
        postman         = AL(0x88, 1),
        all_night       = AL(0x89, 1),
        blast           = AL(0x8A, 1),
        stone           = AL(0x8B, 1),
        great_fairy     = AL(0x8C, 1),
        deku            = AL(0x8D, 1),
        keaton          = AL(0x8E, 1),
        bremen          = AL(0x8F, 1),
        bunny           = AL(0x90, 1),
        don_gero        = AL(0x91, 1),
        scents          = AL(0x92, 1),
        goron           = AL(0x93, 1),
        romani          = AL(0x94, 1),
        troupe_leader   = AL(0x95, 1),
        kafei           = AL(0x96, 1),
        couples         = AL(0x97, 1),
        truth           = AL(0x98, 1),
        zora            = AL(0x99, 1),
        kamaro          = AL(0x9A, 1),
        gibdo           = AL(0x9B, 1),
        garos           = AL(0x9C, 1),
        captains        = AL(0x9D, 1),
        giants          = AL(0x9E, 1),
        fierce_deity    = AL(0x9F, 1),
    },
    quantities = {
        arrows          = AL(0xA1, 1),
        bombs           = AL(0xA6, 1),
        bombchu         = AL(0xA7, 1),
        sticks          = AL(0xA8, 1),
        nuts            = AL(0xA9, 1),
        beans           = AL(0xAA, 1),
        kegs            = AL(0xAC, 1),
    },

    buttons             = AG(0x1A, 2),
    framerate_limiter   = AG(0xA2, 1),
    scene_number        = AG(0xA4, 2),
    screen_T            = AG(0xC0, 4),
    screen_B            = AG(0xC4, 4),
    screen_L            = AG(0xC8, 4),
    screen_R            = AG(0xCC, 4),
    camera_target       = AG(0x2B0, 4),
    camera_mode         = AG(0x362, 2),
    unk_lens            = AG(0x1CA0, 4),
    lens_radius         = AG(0x1CA4, 1),

    actor_count         = AG(0x1CAE, 1),
    actor_counts = {
        [0]=AG(0x1CB0, 4),
        AG(0x1CBC, 4),
        AG(0x1CC8, 4),
        AG(0x1CD4, 4),
        AG(0x1CE0, 4),
        AG(0x1CEC, 4),
        AG(0x1CF8, 4),
        AG(0x1D04, 4),
        AG(0x1D10, 4),
        AG(0x1D1C, 4),
        AG(0x1D28, 4),
        AG(0x1D34, 4),
    },
    actor_firsts = {
        [0]=AG(0x1CB4, 4),
        AG(0x1CC0, 4),
        AG(0x1CCC, 4),
        AG(0x1CD8, 4),
        AG(0x1CE4, 4),
        AG(0x1CF0, 4),
        AG(0x1CFC, 4),
        AG(0x1D08, 4),
        AG(0x1D14, 4),
        AG(0x1D20, 4),
        AG(0x1D2C, 4),
        AG(0x1D38, 4),
    },

    bomb_counter        = AG(0x1CD4, 1),
    z_cursor_actor      = AG(0x1DF8, 4),
    z_target_actor      = AG(0x1DFC, 4),
    current_scene_flags_2 = AG(0x1E58, 4), -- note: I use SRAM ordering here
    current_scene_flags_3 = AG(0x1E5C, 4),
    current_scene_flags_1 = AG(0x1E68, 4),
    current_scene_flags_4 = AG(0x1E6C, 4),
    current_scene_flags_5 = AG(0x1E74, 4),
    cutscene_pointer    = AG(0x1F28, 4),
    cutscene_status_2   = AG(0x1F2C, 1), -- needs a rename
    text_active         = AG(0x1681B, 1),
    text_status         = AG(0x1682A, 1),

    -- offset by -0x20 on JP10/JP11
    wind_x              = AG(0x170B0, 2),
    wind_y              = AG(0x170B2, 2),
    wind_z              = AG(0x170B4, 2),
    wind_power          = AG(0x170B8, 'f'),
    room_number         = AG(0x186E0, 1),
    room_pointer        = AG(0x186EC, 4),
    frames_in_scene     = AG(0x18840, 4),
    actor_disable       = AG(0x18846, 2),
    warp_begin          = AG(0x18875, 1),
    screen_dim          = AG(0x18877, 1),
    warp_destination    = AG(0x1887A, 2),
    entrance_entered    = AG(0x18B48, 1),

    link_actor = setmetatable({
        item_in_hand    = AA(0x148, 1),
        animation_id    = AA(0x24A, 2),
        unk_collision   = AA(0xA68, 4), -- pointer
        link_flags      = AA(0xA6C, 0xC),
        misc_actions    = AA(0xAA5, 1),
        lin_vel         = AA(0xAD0, 'f'),
        movement_angle  = AA(0xAD4, 2),
        active_sword    = AA(0xADB, 1),
        sword_succession= AA(0xADD, 1),
        blast_mask_timer= AA(0xB60, 2),
    }, {__index = Actor(AA(0,0).addr)}),
}
