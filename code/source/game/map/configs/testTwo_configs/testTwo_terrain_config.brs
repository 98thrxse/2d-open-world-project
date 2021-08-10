function testTwo_terrain_config() as object
    config = [
        [
            {
                id: [0, 0],
                entity: {
                    name: "terrain_entity",
                    index: 0,
                    reg: ["house_interior_01"]
                    offset: {
                        x: 0,
                        y: 0
                    }
                }
            }
        ]
    ]

    return config

end function