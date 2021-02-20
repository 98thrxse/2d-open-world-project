function testOne_obj_static_config() as object
    config = [

        {
            id: 0,
            obj: {
                name: "obj_obj",
                x: 100,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 100,
                y: 100,
                width: 128,
                height: 72
            }
        },

        {
            id: 1
            obj: {
                name: "obj_obj",
                x: 300,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 300,
                y: 100,
                width: 128,
                height: 72
            }
        },

        {
            id: 2
            obj: {
                name: "obj_obj",
                x: 500,
                y: 100,
                width: 128,
                height: 72
            },
            col: {
                name: "obj_col",
                x: 500,
                y: 100,
                width: 128,
                height: 72
            }
        }
    ]

    return config

end function