function testOne_obj_config() as object
    config = [

        {
            id: 0,
            anim: {
                alpha: 255
            },
            
            entity: {
                name: "obj_entity",
                x: 100,
                y: 100,
                width: 128,
                height: 72
            },

            col: {
                name: "obj_col",
                x: 110,
                y: 132,
                width: 110,
                height: 8
            }
        },

        {
            id: 1
            anim: {
                alpha: 255
            },

            entity: {
                name: "obj_entity",
                x: 300,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 310,
                y: 132,
                width: 110,
                height: 8
            }
        },

        {
            id: 2,
            anim: {
                alpha: 255
            },

            entity: {
                name: "obj_entity",
                x: 500,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 510,
                y: 132,
                width: 110,
                height: 8
            }
        }
    ]

    return config

end function