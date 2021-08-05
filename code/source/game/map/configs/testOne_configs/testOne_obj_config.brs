function testOne_obj_config() as object
    config = [

        {
            id: 0,
            entity: {
                name: "obj_entity",
                index: 0,
                alpha: 255,
                reg: ["obj_house1_front", "obj_house1_back", "obj_house1_side1", "obj_house1_side2"]
                offset: {
                    x: 9600,
                    y: 2200
                },
                size: {
                    width: 250,
                    height: 250
                }
            },

            col: {
                name: "obj_col",
                offset: {
                    x: 9625,
                    y: 2300,
                },
                size: {
                    width: 200,
                    height: 100
                }
            }
        }
    ]

    return config

end function