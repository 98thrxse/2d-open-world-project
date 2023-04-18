function testOne_veh_config() as object
    config = [

        {
            id: 0,
            name: "veh",
            name_up: "veh_col_up",
            name_down: "veh_col_down",
            name_left: "veh_col_left",
            name_right: "veh_col_right",
            index: 2,
            alpha: 255,
            reg: ["car1_back", "car1_front", "car1_side"],
            col: {
                x: 1913,
                y: 1502,
                width: 165,
                height: 123,
                up: false,
                down: false
                left: false,
                right: false
                npc: invalid,
                marker: invalid,
                veh: invalid,
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
            name_up: "veh_col_up",
            name_down: "veh_col_down",
            name_left: "veh_col_left",
            name_right: "veh_col_right",
            index: 2,
            alpha: 255,
            reg: ["car1_back", "car1_front", "car1_side"],
            col: {
                x: 2113,
                y: 1502,
                width: 165,
                height: 123,
                up: false,
                down: false
                left: false,
                right: false
                npc: invalid,
                marker: invalid,
                veh: invalid,
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