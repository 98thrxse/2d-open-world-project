function testOne_marker_config() as object
    config = [

        {
            id: 0,
            name: "marker",
            index: 0,
            alpha: 255,
            reg: ["marker_transition"],
            offset: {
                x: 9695,
                y: 2415
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