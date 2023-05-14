function testTwo_marker_config() as object
    config = [
        {
            id: 0,
            name: "marker",
            index: 0,
            alpha: 255,
            reg: ["transition"],
            offset: {
                x: 1895,
                y: 1194
            },
            size: {
                width: 60,
                height: 60
            }

            transition: {
                name: "testOne"
                x: 2233,
                y: 1453
            }
        }
    ]

    return config

end function