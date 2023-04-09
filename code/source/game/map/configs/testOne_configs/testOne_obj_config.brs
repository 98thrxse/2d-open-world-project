function testOne_obj_config() as object
    config = [

        {
            id: 0,
            name: "obj",
            index: 0,
            alpha: 255,
            reg: ["obj_exterior1_front", "obj_exterior1_back", "obj_exterior1_side1", "obj_exterior1_side2"]
            col: {
                x: 2138,
                y: 1302
                width: 200,
                height: 125
            },
            entity: {
                x: 2113,
                y: 1202
                width: 250,
                height: 250
            }
        }
    ]

    return config

end function