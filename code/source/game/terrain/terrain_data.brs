function terrain_data() as object

    m.terrain = {

        ' pos
        getEntityPosX: terrain_getEntityPosX
        setEntityPosX: terrain_setEntityPosX
        
        getEntityPosY: terrain_getEntityPosY
        setEntityPosY: terrain_setEntityPosY


        config: invalid

    }

    if m.terrain.config = invalid

        m.terrain.config = [
            [
                {
                    id: 0,
                    obj_name: "terrain_obj",
                    x: 0,
                    y: 0,
                },
    
                {
                    id: 1
                    obj_name: "terrain_obj",
                    x: 1280,
                    y: 0,
                },
    
                {
                    id: 2
                    obj_name: "terrain_obj",
                    x: 2560,
                    y: 0,
                }
            ],
    
            [
                {
                    id: 3,
                    obj_name: "terrain_obj",
                    x: 0,
                    y: 720,
                },
    
                {
                    id: 4
                    obj_name: "terrain_obj",
                    x: 1280,
                    y: 720,
                },
    
                {
                    id: 5
                    obj_name: "terrain_obj",
                    x: 2560,
                    y: 720,
                }
            ],
            
            [
                {
                    id: 6,
                    obj_name: "terrain_obj",
                    x: 0,
                    y: 1440,
                },
    
                {
                    id: 7
                    obj_name: "terrain_obj",
                    x: 1280,
                    y: 1440,
                },
    
                {
                    id: 8
                    obj_name: "terrain_obj",
                    x: 2560,
                    y: 1440,
                }
            ]
        ]

    end if

    return m.terrain

end function



function terrain_getEntityPosX(i as integer, j as integer) as integer
    return m.config[i][j].x
end function

sub terrain_setEntityPosX(i as integer, j as integer, x as integer)
    m.config[i][j].x = x
end sub


function terrain_getEntityPosY(i as integer, j as integer) as integer
    return m.config[i][j].y
end function

sub terrain_setEntityPosY(i as integer, j as integer, y as integer)
    m.config[i][j].y = y
end sub