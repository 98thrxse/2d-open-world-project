function testOne_obj_config() as object
    config = [

        {
            id: 0,
            name: "obj",
            index: 0,
            alpha: 255,
            reg: ["obj_house1_front", "obj_house1_back", "obj_house1_side1", "obj_house1_side2"]
            col: {
                x: 9625,
                y: 2300,
                width: 200,
                height: 100
            },
            entity: {
                x: 9600,
                y: 2200
                width: 250,
                height: 250
            }
        }
    ]

    return config

end function