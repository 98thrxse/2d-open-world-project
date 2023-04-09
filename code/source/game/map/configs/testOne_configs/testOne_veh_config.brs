function testOne_veh_config() as object
    config = [

        {
            id: 0,
            name: "veh",
            index: 2,
            alpha: 255,
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"],
            col: {
                x: 1913,
                y: 1502,
                width: 165,
                height: 123
            },
            entity: {
                x: 1913,
                y: 1502
                width: 165,
                height: 123
            }
            scale: {
                x: 1.0,
                y: 1.0
            },
            speed: {
                up: 5,
                down: 5,
                left: 5,
                right: 5
            },
            time: 100
        },

        {
            id: 1,
            name: "veh",
            index: 2,
            alpha: 255,
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"],
            col: {
                x: 2113,
                y: 1502,
                width: 165,
                height: 123
            },
            entity: {
                x: 2113,
                y: 1502
                width: 165,
                height: 123
            }
            scale: {
                x: 1.0,
                y: 1.0
            },
            speed: {
                up: 5,
                down: 5,
                left: 5,
                right: 5
            },
            time: 100
        }
    ]

    return config

end function