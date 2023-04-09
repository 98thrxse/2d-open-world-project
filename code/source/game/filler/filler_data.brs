function filler_data() as object

    m.filler = {

        getName: filler_getName
        setName: filler_setName

        getOffsetX: filler_getOffsetX
        setOffsetX: filler_setOffsetX
        
        getOffsetY: filler_getOffsetY
        setOffsetY: filler_setOffsetY

        getRegElement: filler_getRegElement
        setRegElement: filler_setRegElement

        getReg: filler_getReg
        setReg: filler_setReg

        getAnimTime: filler_getAnimTime
        setAnimTime: filler_setAnimTime

        getIndex: filler_getIndex
        setIndex: filler_setIndex

        config: invalid

    }

    if m.filler.config = invalid

        m.filler.config = []

    end if

    return m.filler

end function


function filler_getName(i as object, j as object) as object
    return m.config[i][j].name
end function

sub filler_setName(i as object, j as object, name as object)
    m.config[i][j].name = name
end sub


function filler_getOffsetX(i as object, j as object) as object
    return m.config[i][j].offset.x
end function

sub filler_setOffsetX(i as object, j as object, x as object)
    m.config[i][j].offset.x = x
end sub


function filler_getOffsetY(i as object, j as object) as object
    return m.config[i][j].offset.y
end function

sub filler_setOffsetY(i as object, j as object, y as object)
    m.config[i][j].offset.y = y
end sub


function filler_getRegElement(i as object, j as object, k as object) as object
    return m.config[i][j].reg[k]
end function

sub filler_setRegElement(i as object, j as object, k as object, reg as object)
    m.config[i][j].reg[k] = reg
end sub

function filler_getReg(i as object, j as object) as object
    return m.config[i][j].reg
end function

sub filler_setReg(i as object, j as object, reg as object)
    m.config[i][j].reg = reg
end sub

function filler_getIndex(i as object, j as object) as object
    return m.config[i][j].index
end function

sub filler_setIndex(i as object, j as object, index as object)
    m.config[i][j].index = index
end sub

function filler_getAnimTime(i as object, j as object) as object
    return m.config[i][j].time
end function

sub filler_setAnimTime(i as object, j as object, time as object)
    m.config[i][j].time = time
end sub