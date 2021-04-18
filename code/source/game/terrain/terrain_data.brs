function terrain_data() as object

    m.terrain = {

        ' entity
        getEntityName: terrain_getEntityName
        setEntityName: terrain_setEntityName

        getEntityOffsetX: terrain_getEntityOffsetX
        setEntityOffsetX: terrain_setEntityOffsetX
        
        getEntityOffsetY: terrain_getEntityOffsetY
        setEntityOffsetY: terrain_setEntityOffsetY

        getReg: terrain_getReg
        setReg: terrain_setReg


        config: invalid

    }

    if m.terrain.config = invalid

        m.terrain.config = []

    end if

    return m.terrain

end function


function terrain_getEntityName(i as integer, j as integer) as object
    return m.config[i][j].entity.name
end function

sub terrain_setEntityName(i as integer, j as integer, name as string)
    m.config[i][j].entity.name = name
end sub


function terrain_getEntityOffsetX(i as integer, j as integer) as integer
    return m.config[i][j].entity.anim.offset.x
end function

sub terrain_setEntityOffsetX(i as integer, j as integer, x as integer)
    m.config[i][j].entity.anim.offset.x = x
end sub


function terrain_getEntityOffsetY(i as integer, j as integer) as integer
    return m.config[i][j].entity.anim.offset.y
end function

sub terrain_setEntityOffsetY(i as integer, j as integer, y as integer)
    m.config[i][j].entity.anim.offset.y = y
end sub


function terrain_getReg(i as integer, j as integer, k as integer) as object
    return m.config[i][j].entity.anim.reg[k]
end function

sub terrain_setReg(i as integer, j as integer, k as integer, reg as object)
    m.config[i][j].entity.anim.reg[k] = reg
end sub