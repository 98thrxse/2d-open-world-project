function testTwo_char_config() as object
    config = {
        name: "char_entity"
        name_up: "char_col_up",
        name_down: "char_col_down",
        name_left: "char_col_left",
        name_right: "char_col_right",
        size: {
            width: 48,
            height: 56
        },
        index: 0,
        alpha: 255,
        reg: ["char1_idle_back1", "char1_idle_front1", "char1_idle_side1", "char1_walk_back1", "char1_walk_back2", "char1_walk_front1", "char1_walk_front2", "char1_walk_side1", "char1_walk_side2", "char1_hp_zero", "char1_sp_zero", "char1_idle_back2", "char1_idle_front2", "char1_idle_side2", "char1_attack_fist1_back", "char1_attack_fist2_back", "char1_attack_leg1_back", "char1_attack_fist1_front", "char1_attack_fist2_front", "char1_attack_leg1_front", "char1_attack_fist1_side", "char1_attack_fist2_side", "char1_attack_fist3_side", "char1_attack_fist4_side", "char1_attack_fist5_side", "char1_attack_fist6_side", "char1_attack_leg1_side", "char1_attack_leg2_side", "char1_attack_leg3_side"]
        scale: {
            x: 1.0
            y: 1.0
        },
        offset: {
            x: 616,
            y: 332
        },
        time: 100
        pos: {
            x: invalid,
            y: invalid
        },
        col: {
            up: false,
            down: false
            left: false,
            right: false
            npc: invalid,
            marker: invalid,
            veh: invalid,
        }
        hp: 100,
        sp: 100
        damage: {
            hp: 10,
            sp: 10,
            hp_time: 500,
            sp_time: 500
        },
        regen: {
            hp: 5,
            sp: 5,
            hp_time: 1000,
            sp_time: 1000
        },
        speed: {
            up: 2,
            down: 2,
            left: 2,
            right: 2
        }
        veh: invalid,
        map: invalid
    }

    return config

end function