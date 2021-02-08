function testOne_terrain_static_config() as object
    config = [

        {
            id: 0,
            obj_name: "terrain_obj",
            offset_x: 0,
            offset_y: 0,
        },

        {
            id: 1
            obj_name: "terrain_obj",
            offset_x: 1280,
            offset_y: 0,
        },

        {
            id: 2
            obj_name: "terrain_obj",
            offset_x: 2560,
            offset_y: 0,
        }
    ]

    return config

end function