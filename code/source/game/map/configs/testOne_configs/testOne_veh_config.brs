function testOne_veh_config() as object
    config = [

        {
            id: 0,
            name: "veh",
            index: 2,
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"],
            col: {
                x: 9400,
                y: 2500,
                width: 165,
                height: 123
            },
            entity: {
                x: 9400,
                y: 2500
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
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"],
            col: {
                x: 9600,
                y: 2500,
                width: 165,
                height: 123
            },
            entity: {
                x: 9600,
                y: 2500
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