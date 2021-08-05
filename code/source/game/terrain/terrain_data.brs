function terrain_data() as object

    m.terrain = {

        ' entity
        getEntityName: terrain_getEntityName
        setEntityName: terrain_setEntityName

        getEntityOffsetX: terrain_getEntityOffsetX
        setEntityOffsetX: terrain_setEntityOffsetX
        
        getEntityOffsetY: terrain_getEntityOffsetY
        setEntityOffsetY: terrain_setEntityOffsetY

        getRegElement: terrain_getRegElement
        setRegElement: terrain_setRegElement

        getReg: terrain_getReg
        setReg: terrain_setReg

        getIndex: terrain_getIndex
        setIndex: terrain_setIndex

        config: invalid

    }

    if m.terrain.config = invalid

        m.terrain.config = []

    end if

    return m.terrain

end function


function terrain_getEntityName(i as object, j as object) as object
    return m.config[i][j].entity.name
end function

sub terrain_setEntityName(i as object, j as object, name as object)
    m.config[i][j].entity.name = name
end sub


function terrain_getEntityOffsetX(i as object, j as object) as object
    return m.config[i][j].entity.offset.x
end function

sub terrain_setEntityOffsetX(i as object, j as object, x as object)
    m.config[i][j].entity.offset.x = x
end sub


function terrain_getEntityOffsetY(i as object, j as object) as object
    return m.config[i][j].entity.offset.y
end function

sub terrain_setEntityOffsetY(i as object, j as object, y as object)
    m.config[i][j].entity.offset.y = y
end sub


function terrain_getRegElement(i as object, j as object, k as object) as object
    return m.config[i][j].entity.reg[k]
end function

sub terrain_setRegElement(i as object, j as object, k as object, reg as object)
    m.config[i][j].entity.reg[k] = reg
end sub

function terrain_getReg(i as object, j as object) as object
    return m.config[i][j].entity.reg
end function

sub terrain_setReg(i as object, j as object, reg as object)
    m.config[i][j].entity.reg = reg
end sub

function terrain_getIndex(i as object, j as object) as object
    return m.config[i][j].entity.index
end function

sub terrain_setIndex(i as object, j as object, index as object)
    m.config[i][j].entity.index = index
end sub