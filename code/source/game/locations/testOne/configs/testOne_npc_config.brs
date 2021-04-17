function testOne_npc_config() as object
    config = [

        {
            id: 0,
            entity: {
                name: "npc_entity",
                anim: {
                    index: 0,
                    reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_side2", "attack_fist1", "attack_fist2", "attack_fist3", "attack_fist4", "attack_fist5", "attack_fist6", "attack_leg1", "attack_leg2", "attack_leg3"]
                },
                pos: {
                    x: 800,
                    y: 100
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            col: {
                name: "npc_col",
                pos: {
                    x: 800,
                    y: 100
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            attrs: {
                hp: 100
            }

        },

        {
            id: 1
            entity: {
                name: "npc_entity",
                anim: {
                    index: 0,
                    reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_side2", "attack_fist1", "attack_fist2", "attack_fist3", "attack_fist4", "attack_fist5", "attack_fist6", "attack_leg1", "attack_leg2", "attack_leg3"]
                },
                pos: {
                    x: 800,
                    y: 300
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            col: {
                name: "npc_col",
                pos: {
                    x: 800,
                    y: 300
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            attrs: {
                hp: 100
            }
        },

        {
            id: 2
            entity: {
                name: "npc_entity",
                anim: {
                    index: 0,
                    reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_side2", "attack_fist1", "attack_fist2", "attack_fist3", "attack_fist4", "attack_fist5", "attack_fist6", "attack_leg1", "attack_leg2", "attack_leg3"]
                },
                pos: {
                    x: 800,
                    y: 500
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            col: {
                name: "npc_col",
                pos: {
                    x: 800,
                    y: 500
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            attrs: {
                hp: 100
            }
        }
    ]

    return config

end function