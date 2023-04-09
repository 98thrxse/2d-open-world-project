function testOne_marker_config() as object
    config = [

        {
            id: 0,
            name: "marker",
            index: 0,
            alpha: 255,
            reg: ["marker_transition"],
            offset: {
                x: 2208,
                y: 1418
            },
            size: {
                width: 60,
                height: 60
            }
            transition: {
                name: "testTwo",
                x: 155,
                y: 270
            }
        }
    ]

    return config

end function