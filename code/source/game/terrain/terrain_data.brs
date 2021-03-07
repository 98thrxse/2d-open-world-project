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

        m.terrain.config = []

    end if

    return m.terrain

end function



function terrain_getEntityPosX(i as integer, j as integer) as integer
    return m.config[i][j].entity.x
end function

sub terrain_setEntityPosX(i as integer, j as integer, x as integer)
    m.config[i][j].entity.x = x
end sub


function terrain_getEntityPosY(i as integer, j as integer) as integer
    return m.config[i][j].entity.y
end function

sub terrain_setEntityPosY(i as integer, j as integer, y as integer)
    m.config[i][j].entity.y = y
end sub