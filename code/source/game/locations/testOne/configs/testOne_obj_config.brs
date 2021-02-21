function testOne_obj_config() as object
    config = [

        {
            id: 0,
            anim: {
                alpha: 255
            },
            
            entity: {
                name: "obj_obj",
                x: 100,
                y: 100,
                width: 128,
                height: 72
            },

            col: {
                name: "obj_col",
                x: 100,
                y: 132,
                width: 128,
                height: 8
            }
        },

        {
            id: 1
            anim: {
                alpha: 255
            },

            entity: {
                name: "obj_obj",
                x: 300,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 300,
                y: 132,
                width: 128,
                height: 8
            }
        },

        {
            id: 2,
            anim: {
                alpha: 255
            },

            entity: {
                name: "obj_obj",
                x: 500,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 500,
                y: 132,
                width: 128,
                height: 8
            }
        }
    ]

    return config

end function