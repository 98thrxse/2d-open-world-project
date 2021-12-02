function testOne_veh_config() as object
    config = [

        {
            id: 0,
            name: "veh",
            index: 1,
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"]
            offset: {
                x: 9400,
                y: 2500
            },
            scale: {
                x: 1.0,
                y: 1.0
            },
            size: {
                width: 127,
                height: 95
            }
            speed: {
                up: 5,
                down: 5,
                left: 5,
                right: 5
            }
        }
    ]

    return config

end function