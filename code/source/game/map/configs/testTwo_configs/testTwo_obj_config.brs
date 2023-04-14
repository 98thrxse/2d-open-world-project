function testTwo_obj_config() as object
    config = [
        {
            id: 0,
            name: "obj",
            index: 0,
            alpha: 255,
            reg: ["exterior1_front", "exterior1_back", "exterior1_side1", "exterior1_side2"]
            col: {
                x: 2038,
                y: 1302
                width: 200,
                height: 125
            },
            entity: {
                x: 2013,
                y: 1202
                width: 250,
                height: 250
            }
        },
        {
            id: 1,
            name: "obj",
            index: 0,
            alpha: 255,
            reg: ["exterior1_front", "exterior1_back", "exterior1_side1", "exterior1_side2"]
            col: {
                x: 2038,
                y: 1202
                width: 200,
                height: 125
            },
            entity: {
                x: 2013,
                y: 1102
                width: 250,
                height: 250
            }
        }
    ]

    return config

end function