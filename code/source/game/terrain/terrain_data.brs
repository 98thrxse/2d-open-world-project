function terrain_data() as object

    m.terrain = {

        ' entity
        getEntityName: terrain_getEntityName
        setEntityName: terrain_setEntityName

        getEntityPosX: terrain_getEntityPosX
        setEntityPosX: terrain_setEntityPosX
        
        getEntityPosY: terrain_getEntityPosY
        setEntityPosY: terrain_setEntityPosY

        getReg: terrain_getReg
        setReg: terrain_setReg


        config: invalid

    }

    if m.terrain.config = invalid

        m.terrain.config = []

    end if

    return m.terrain

end function


function terrain_getEntityName(i as integer, j as integer) as integer
    return m.config[i][j].entity.name
end function

sub terrain_setEntityName(i as integer, j as integer, name as string)
    m.config[i][j].entity.name = name
end sub


function terrain_getEntityPosX(i as integer, j as integer) as integer
    return m.config[i][j].entity.pos.x
end function

sub terrain_setEntityPosX(i as integer, j as integer, x as integer)
    m.config[i][j].entity.pos.x = x
end sub


function terrain_getEntityPosY(i as integer, j as integer) as integer
    return m.config[i][j].entity.pos.y
end function

sub terrain_setEntityPosY(i as integer, j as integer, y as integer)
    m.config[i][j].entity.pos.y = y
end sub


function terrain_getReg(i as integer, j as integer, k as integer) as integer
    return m.config[i][j].entity.anim.reg[k]
end function

sub terrain_setReg(i as integer, j as integer, k as integer, reg as object)
    m.config[i][j].entity.anim.reg[k] = reg
end sub