function testOne_terrain_config() as object
    config = [

        [
            {
                id: 0,
                entity: {
                    name: "terrain_entity",
                    x: 0,
                    y: 0
                }

            },

            {
                id: 1,
                entity: {
                    name: "terrain_entity",
                    x: 1280,
                    y: 0
                }
 
            },

            {
                id: 2,
                entity: {
                    name: "terrain_entity",
                    x: 2560,
                    y: 0
                }
            }
        ],

        [
            {
                id: 3,
                entity: {
                    name: "terrain_entity",
                    x: 0,
                    y: 720
                }
            },

            {
                id: 4
                entity: {
                    name: "terrain_entity",
                    x: 1280,
                    y: 720
                }
            },

            {
                id: 5
                entity: {
                    name: "terrain_entity",
                    x: 2560,
                    y: 720
                }
            }
        ]
    ]

    return config

end function