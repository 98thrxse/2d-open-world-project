function terrain_data() as object

    m.terrain = {

        ' pos
        getPosX: terrain_getPosX
        setPosX: terrain_setPosX
        
        getPosY: terrain_getPosY
        setPosY: terrain_setPosY


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



function terrain_getPosX(i as integer, j as integer) as integer
    return m.config[i][j].x
end function

sub terrain_setPosX(id_x as integer, id_y as integer, x as integer)
    m.config[i][j].x = x
end sub


function terrain_getPosY(i as integer, j as integer) as integer
    return m.config[i][j].y
end function

sub terrain_setPosY(i as integer, j as integer, y as integer)
    m.config[i][j].y = y
end sub