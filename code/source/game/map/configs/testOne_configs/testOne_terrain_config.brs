function testOne_terrain_config() as object
    config = [

        [
            {
                id: [0, 0],
                name: "terrain",
                index: 0,
                reg: ["terrain_01"]
                offset: {
                    x: 0,
                    y: 0
                }
            },

            {
                id: [0, 1],
                name: "terrain",
                index: 0,
                reg: ["terrain_02"]
                offset: {
                    x: 1280,
                    y: 0
                }
            },

            {
                id: [0, 2],
                name: "terrain",
                index: 0,
                reg: ["terrain_03"]
                offset: {
                    x: 2560,
                    y: 0
                }
            }

        ],

        [
            {
                id: [1, 0],
                name: "terrain",
                index: 0,
                reg: ["terrain_04"]
                offset: {
                    x: 0,
                    y: 720
                }
            },

            {
                id: [1, 1],
                name: "terrain",
                index: 0,
                reg: ["terrain_05"]
                offset: {
                    x: 1280,
                    y: 720
                }
            },

            {
                id: [1, 2],
                name: "terrain",
                index: 0,
                reg: ["terrain_06"]
                offset: {
                    x: 2560,
                    y: 720
                }
            }

        ],

        [
            {
                id: [2, 0],
                name: "terrain",
                index: 0,
                reg: ["terrain_07"]
                offset: {
                    x: 0,
                    y: 1440
                }
            },

            {
                id: [2, 1],
                name: "terrain",
                index: 0,
                reg: ["terrain_08"]
                offset: {
                    x: 1280,
                    y: 1440
                }
            },

            {
                id: [2, 2],
                name: "terrain",
                index: 0,
                reg: ["terrain_09"]
                offset: {
                    x: 2560,
                    y: 1440
                }
            }
        ],
    ]

    return config

end function