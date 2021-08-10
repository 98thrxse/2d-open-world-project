function testTwo_char_config() as object
    config = {

        entity: {
            name: "char_entity"
            size: {
                width: 48,
                height: 56
            },

            index: 0,
            alpha: 255,
            reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_back2", "stand_front2", "stand_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
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
                x: 150,
                y: 270
            },

        }

        col: {
            name_up: "char_col_up",
            name_down: "char_col_down",
            name_left: "char_col_left",
            name_right: "char_col_right",

            offset: {
                x: 616,
                y: 332
            },
            size: {
                width: 48,
                height: 56,
            },

            up: false,
            down: false
            left: false,
            right: false

            npc: invalid,
            marker: invalid
        },

        attrs: {
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
        },

        intersect: {
            obj: invalid
        },

    }

    return config

end function