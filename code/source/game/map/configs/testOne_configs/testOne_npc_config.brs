function testOne_npc_config() as object
    config = [

        {
            id: 0,
            entity: {
                name: "npc_entity",
                anim: {
                    index: 1,
                    reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_back2", "stand_front2", "stand_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
                    offset: {
                        x: 800,
                        y: 100
                    },
                    time: 100
                },
                size: {
                    width: 48,
                    height: 56
                }
            },

            col: {
                name: "npc_col",
                offset: {
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
                    reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_back2", "stand_front2", "stand_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
                    offset: {
                        x: 800,
                        y: 300
                    },
                    time: 100
                },

                size: {
                    width: 48,
                    height: 56
                }
            },

            col: {
                name: "npc_col",
                offset: {
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
                    reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_back2", "stand_front2", "stand_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
                    offset: {
                        x: 800,
                        y: 500
                    },
                    time: 100
                },

                size: {
                    width: 48,
                    height: 56
                }
            },

            col: {
                name: "npc_col",
                offset: {
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