function testOne_border_config() as object
    config = [
        {
            id: 0,
            name: "border",
            col: {
                x: 0,
                y: 0,
                width: 3840,
                height: 360
            }
        },
        {
            id: 1,
            name: "border",
            col: {
                x: 0,
                y: 1800,
                width: 3840,
                height: 360
            }
        },
        {
            id: 2,
            name: "border",
            col: {
                x: 0,
                y: 0,
                width: 640,
                height: 2160
            }
        },
        {
            id: 3,
            name: "border",
            col: {
                x: 3200,
                y: 0,
                width: 640,
                height: 2160
            }
        }
    ]

    return config

end function