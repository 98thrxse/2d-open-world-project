function testOne_veh_config() as object
    config = [

        {
            id: 0,
            name: "veh_entity",
            name_up: "veh_col_up",
            name_down: "veh_col_down",
            name_left: "veh_col_left",
            name_right: "veh_col_right",
            index: 2,
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"]
            offset: {
                x: 9400,
                y: 2500
            },
            scale: {
                x: -1.0,
                y: 1.0
            },
            size: {
                width: 165,
                height: 123
            }
            speed: {
                up: 5,
                down: 5,
                left: 5,
                right: 5
            },
            col: {
                up: invalid,
                down: invalid
                left: invalid,
                right: invalid
                npc: invalid,
                marker: invalid,
                veh: invalid,
            },
            time: 100
        },

        {
            id: 1,
            name: "veh_entity",
            name_up: "veh_col_up",
            name_down: "veh_col_down",
            name_left: "veh_col_left",
            name_right: "veh_col_right",
            index: 2,
            reg: ["veh_car1_back", "veh_car1_front", "veh_car1_side"]
            offset: {
                x: 9600,
                y: 2500
            },
            scale: {
                x: 1.0,
                y: 1.0
            },
            size: {
                width: 165,
                height: 123
            }
            speed: {
                up: 5,
                down: 5,
                left: 5,
                right: 5
            },
            col: {
                up: invalid,
                down: invalid
                left: invalid,
                right: invalid
                npc: invalid,
                marker: invalid,
                veh: invalid,
            },
            time: 100
        }
    ]

    return config

end function