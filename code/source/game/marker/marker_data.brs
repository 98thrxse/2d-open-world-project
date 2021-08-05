function marker_data() as object

    m.marker = {

        ' entity
        getEntityName: marker_getEntityName
        setEntityName: marker_setEntityName

        getAlpha: marker_getAlpha
        setAlpha: marker_setAlpha

        getRegElement: marker_getRegElement
        setRegElement: marker_setRegElement

        getReg: marker_getReg
        setReg: marker_setReg

        getEntityOffsetX: marker_getEntityOffsetX
        setEntityOffsetX: marker_setEntityOffsetX
        
        getEntityOffsetY: marker_getEntityOffsetY
        setEntityOffsetY: marker_setEntityOffsetY

        getEntityH: marker_getEntityH
        setEntityH: marker_setEntityH
        
        getEntityW: marker_getEntityW
        setEntityW: marker_setEntityW

        getIndex: marker_getIndex
        setIndex: marker_setIndex

        config: invalid

    }

    if m.marker.config = invalid

        m.marker.config = []

    end if

    return m.marker

end function

function marker_getEntityName(i as object) as object
    return m.config[i].entity.name
end function

sub marker_setEntityName(i as object, name as object)
    m.config[i].entity.name = name
end sub


function marker_getAlpha(i as object) as object
    return m.config[i].entity.alpha
end function

sub marker_setAlpha(i as object, alpha as object)
    m.config[i].entity.alpha = alpha
end sub


function marker_getRegElement(i as object, j as object) as object
    return m.config[i].entity.reg[j]
end function

sub marker_setRegElement(i as object, j as object, reg as object)
    m.config[i].entity.reg[j] = reg
end sub


function marker_getReg(i as object) as object
    return m.config[i].entity.reg
end function

sub marker_setReg(i as object, reg as object)
    m.config[i].entity.reg = reg
end sub

function marker_getEntityOffsetX(i as object) as object
    return m.config[i].entity.offset.x
end function

sub marker_setEntityOffsetX(i as object, x as object)
    m.config[i].entity.offset.x = x
end sub


function marker_getEntityOffsetY(i as object) as object
    return m.config[i].entity.offset.y
end function

sub marker_setEntityOffsetY(i as object, y as object)
    m.config[i].entity.offset.y = y
end sub


function marker_getEntityH(i as object) as object
    return m.config[i].entity.size.height
end function

sub marker_setEntityH(i as object, height as object)
    m.config[i].entity.size.height = height
end sub

function marker_getEntityW(i as object) as object
    return m.config[i].entity.size.width
end function

sub marker_setEntityW(i as object, width as object)
    m.config[i].entity.size.width = width
end sub

function marker_getIndex(i as object) as object
    return m.config[i].entity.index
end function

sub marker_setIndex(i as object, index as object)
    m.config[i].entity.index = index
end sub

