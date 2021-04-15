function testOne_obj_config() as object
    config = [

        {
            id: 0,
            entity: {
                name: "obj_entity",
                anim: {
                    alpha: 255
                    reg: ["obj_0"]
                },
                pos: {
                    x: 100,
                    y: 100,
                },
                size: {
                    width: 128,
                    height: 72
                }
            },

            col: {
                name: "obj_col",
                pos: {
                    x: 110,
                    y: 132,
                },
                size: {
                    width: 110,
                    height: 8
                }
            }
        },

        {
            id: 1
            entity: {
                name: "obj_entity",
                anim: {
                    alpha: 255
                    reg: ["obj_1"]
                },
                pos: {
                    x: 300,
                    y: 100,
                },
                size: {
                    width: 128,
                    height: 72
                }
            },
            col: {
                name: "obj_col",
                pos: {
                    x: 310,
                    y: 132,
                },
                size: {
                    width: 110,
                    height: 8
                }
            }
        },

        {
            id: 2,
            entity: {
                name: "obj_entity",
                anim: {
                    alpha: 255
                    reg: ["obj_0"]
                },
                pos: {
                    x: 500,
                    y: 100,
                },
                size: {
                    width: 128,
                    height: 72
                }
            },
            col: {
                name: "obj_col",
                pos: {
                    x: 510,
                    y: 132,
                }
                size: {
                    width: 110,
                    height: 8
                }
            }
        }
    ]

    return config

end function