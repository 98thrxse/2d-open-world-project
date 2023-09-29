function testOne_npc_config() as object
    config = [

        {
            id: 0,
            name: "npc",
            index: 1,
            alpha: 255,
            reg: ["npc1_idle_back1", "npc1_idle_front1", "npc1_idle_side1", "npc1_walk_back1", "npc1_walk_back2", "npc1_walk_front1", "npc1_walk_front2", "npc1_walk_side1", "npc1_walk_side2", "npc1_hp_zero", "npc1_sp_zero", "npc1_idle_back2", "npc1_idle_front2", "npc1_idle_side2", "npc1_attack_fist1_back", "npc1_attack_fist2_back", "npc1_attack_leg1_back", "npc1_attack_fist1_front", "npc1_attack_fist2_front", "npc1_attack_leg1_front", "npc1_attack_fist1_side", "npc1_attack_fist2_side", "npc1_attack_fist3_side", "npc1_attack_fist4_side", "npc1_attack_fist5_side", "npc1_attack_fist6_side", "npc1_attack_leg1_side", "npc1_attack_leg2_side", "npc1_attack_leg3_side"]
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
            reg: ["npc1_idle_back1", "npc1_idle_front1", "npc1_idle_side1", "npc1_walk_back1", "npc1_walk_back2", "npc1_walk_front1", "npc1_walk_front2", "npc1_walk_side1", "npc1_walk_side2", "npc1_hp_zero", "npc1_sp_zero", "npc1_idle_back2", "npc1_idle_front2", "npc1_idle_side2", "npc1_attack_fist1_back", "npc1_attack_fist2_back", "npc1_attack_leg1_back", "npc1_attack_fist1_front", "npc1_attack_fist2_front", "npc1_attack_leg1_front", "npc1_attack_fist1_side", "npc1_attack_fist2_side", "npc1_attack_fist3_side", "npc1_attack_fist4_side", "npc1_attack_fist5_side", "npc1_attack_fist6_side", "npc1_attack_leg1_side", "npc1_attack_leg2_side", "npc1_attack_leg3_side"]
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