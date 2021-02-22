function testOne_terrain_config() as object
    config = [

        [
            {
                id: 0,
                obj_name: "terrain_entity",
                offset_x: 0,
                offset_y: 0,
            },

            {
                id: 1
                obj_name: "terrain_entity",
                offset_x: 1280,
                offset_y: 0,
            },

            {
                id: 2
                obj_name: "terrain_entity",
                offset_x: 2560,
                offset_y: 0,
            }
        ],

        [
            {
                id: 3,
                obj_name: "terrain_entity",
                offset_x: 0,
                offset_y: 720,
            },

            {
                id: 4
                obj_name: "terrain_entity",
                offset_x: 1280,
                offset_y: 720,
            },

            {
                id: 5
                obj_name: "terrain_entity",
                offset_x: 2560,
                offset_y: 720,
            }
        ],
        [
            {
                id: 6,
                obj_name: "terrain_entity",
                offset_x: 0,
                offset_y: 1440,
            },

            {
                id: 7
                obj_name: "terrain_entity",
                offset_x: 1280,
                offset_y: 1440,
            },

            {
                id: 8
                obj_name: "terrain_entity",
                offset_x: 2560,
                offset_y: 1440,
            }
        ]
    ]

    return config

end function