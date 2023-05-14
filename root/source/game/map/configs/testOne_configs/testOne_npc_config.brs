function testOne_npc_config() as object
    config = [

        {
            id: 0,
            name: "npc",
            index: 1,
            alpha: 255,
            reg: ["idle_back1", "idle_front1", "idle_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "idle_back2", "idle_front2", "idle_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
            offset: {
                x: 1913,
                y: 802
            },
            scale: {
                x: 1.0,
                y: 1.0
            },
            time: 100
            size: {
                width: 48,
                height: 56
            }
            path: {
                cycle: 0,
                position: [ [1913, 802], [2013, 1002] ]
            },
            hp: 100,
            speed: {
                up: 1,
                down: 1,
                left: 1,
                right: 1
            }

        },

        {
            id: 1
            name: "npc",
            index: 1,
            alpha: 255,
            reg: ["idle_back1", "idle_front1", "idle_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "idle_back2", "idle_front2", "idle_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
            offset: {
                x: 2313,
                y: 1052
            },
            scale: {
                x: 1.0,
                y: 1.0
            },
            time: 100

            size: {
                width: 48,
                height: 56
            }
            path: {
                cycle: invalid,
                position: []
            },
            hp: 100,
            speed: {
                up: 1,
                down: 1,
                left: 1,
                right: 1
            }
        }
    ]

    return config

end function