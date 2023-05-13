function terrain_data() as object

    terrain = {

        getName: terrain_getName
        setName: terrain_setName

        getOffsetX: terrain_getOffsetX
        setOffsetX: terrain_setOffsetX
        
        getOffsetY: terrain_getOffsetY
        setOffsetY: terrain_setOffsetY

        getRegElement: terrain_getRegElement
        setRegElement: terrain_setRegElement

        getReg: terrain_getReg
        setReg: terrain_setReg

        getIndex: terrain_getIndex
        setIndex: terrain_setIndex

        config: invalid

    }

    if terrain.config = invalid

        terrain.config = []

    end if

    return terrain

end function


function terrain_getName(i as object, j as object) as object
    return m.config[i][j].name
end function

sub terrain_setName(i as object, j as object, name as object)
    m.config[i][j].name = name
end sub


function terrain_getOffsetX(i as object, j as object) as object
    return m.config[i][j].offset.x
end function

sub terrain_setOffsetX(i as object, j as object, x as object)
    m.config[i][j].offset.x = x
end sub


function terrain_getOffsetY(i as object, j as object) as object
    return m.config[i][j].offset.y
end function

sub terrain_setOffsetY(i as object, j as object, y as object)
    m.config[i][j].offset.y = y
end sub


function terrain_getRegElement(i as object, j as object, k as object) as object
    return m.config[i][j].reg[k]
end function

sub terrain_setRegElement(i as object, j as object, k as object, reg as object)
    m.config[i][j].reg[k] = reg
end sub

function terrain_getReg(i as object, j as object) as object
    return m.config[i][j].reg
end function

sub terrain_setReg(i as object, j as object, reg as object)
    m.config[i][j].reg = reg
end sub

function terrain_getIndex(i as object, j as object) as object
    return m.config[i][j].index
end function

sub terrain_setIndex(i as object, j as object, index as object)
    m.config[i][j].index = index
end sub