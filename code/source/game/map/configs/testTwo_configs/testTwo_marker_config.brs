function testTwo_marker_config() as object
    config = [

        {
            id: 0,
            entity: {
                name: "marker_entity",
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
            },
            col: {
                name: "marker_col",
                offset: {
                    x: 9695,
                    y: 2415
                },
                size: {
                    width: 60,
                    height: 60
                }
            },
            attrs: {
                map: "testOne"
            }
        }
    ]

    return config

end function