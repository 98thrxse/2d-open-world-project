function testOne_npc_config() as object
    config = [

        {
            id: 0,
            anim: {
                index: 1,
            },

            entity: {
                name: "npc_obj",
                x: 800,
                y: 100,
                width: 48,
                height: 56
            },

            col: {
                name: "npc_col",
                x: 800,
                y: 100,
                width: 48,
                height: 56
            },

            attributes: {
                hp: 100
            }

        },

        {
            id: 1
            anim: {
                index: 1,
            },

            entity: {
                name: "npc_obj",
                x: 800,
                y: 300,
                width: 48,
                height: 56
            },

            col: {
                name: "npc_col",
                x: 800,
                y: 300,
                width: 48,
                height: 56
            },

            attributes: {
                hp: 100
            }
        },

        {
            id: 2
            anim: {
                index: 1,
            },

            entity: {
                name: "npc_obj",
                x: 800,
                y: 500,
                width: 48,
                height: 56
            },

            col: {
                name: "npc_col",
                x: 800,
                y: 500,
                width: 48,
                height: 56
            },

            attributes: {
                hp: 100
            }
        }
    ]

    return config

end function