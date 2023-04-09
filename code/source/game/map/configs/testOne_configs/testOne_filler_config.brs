function testOne_filler_config() as object
    config = [
        [
            {
                id: [0, 0],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 0,
                    y: 0
                },
                time: 1000
            },

            {
                id: [0, 1],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 1280,
                    y: 0
                },
                time: 1000
            },

            {
                id: [0, 2],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 2560,
                    y: 0
                },
                time: 1000
            }

        ],

        [
            {
                id: [1, 0],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 0,
                    y: 720
                },
                time: 1000
            },

            {
                id: [1, 1],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 1280,
                    y: 720
                },
                time: 1000
            },

            {
                id: [1, 2],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 2560,
                    y: 720
                },
                time: 1000
            }

        ],

        [
            {
                id: [2, 0],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 0,
                    y: 1440
                },
                time: 1000
            },

            {
                id: [2, 1],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 1280,
                    y: 1440
                },
                time: 1000
            },

            {
                id: [2, 2],
                name: "filler",
                index: 0,
                reg: ["filler_01", "filler_02"]
                offset: {
                    x: 2560,
                    y: 1440
                },
                time: 1000
            }
        ],
    ]

    return config

end function