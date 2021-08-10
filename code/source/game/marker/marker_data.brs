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

        ' col
        getColName: marker_getColName
        setColName: marker_setColName

        getColOffsetX: marker_getColOffsetX
        setColOffsetX: marker_setColOffsetX
        
        getColOffsetY: marker_getColOffsetY
        setColOffsetY: marker_setColOffsetY

        getColW: marker_getColW
        setColW: marker_setColW
        
        getColH: marker_getEntityH
        setColH: marker_setColH

        ' attrs
        getMap: marker_getMap
        setMap: marker_setMap

        getTransitionX: marker_getTransitionX
        setTransitionX: marker_setTransitionX

        getTransitionY: marker_getTransitionY
        setTransitionY: marker_setTransitionY

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


function marker_getColOffsetX(i as object) as object
    return m.config[i].col.offset.x
end function

sub marker_setColOffsetX(i as object, x as object)
    m.config[i].col.offset.x = x
end sub

function marker_getColOffsetY(i as object) as object
    return m.config[i].col.offset.y
end function

sub marker_setColOffsetY(i as object, y as object)
    m.config[i].col.offset.y = y
end sub

function marker_getColW(i as object) as object
    return m.config[i].col.size.width
end function

sub marker_setColW(i as object, width as object)
    m.config[i].col.size.width = width
end sub

function marker_getColH(i as object) as object
    return m.config[i].col.size.height
end function

sub marker_setColH(i as object, height as object)
    m.config[i].col.size.height = height
end sub

function marker_getColName(i as object) as object
    return m.config[i].col.name
end function

sub marker_setColName(i as object, name as object)
    m.config[i].col.name = name
end sub

function marker_getMap(i as object) as object
    return m.config[i].attrs.map
end function

sub marker_setMap(i as object, map as object)
    m.config[i].attrs.map = map
end sub

function marker_getTransitionX(i as object) as object
    return m.config[i].attrs.x
end function

sub marker_setTransitionX(i as object, x as object)
    m.config[i].attrs.x = x
end sub

function marker_getTransitionY(i as object) as object
    return m.config[i].attrs.y
end function

sub marker_setTransitionY(i as object, y as object)
    m.config[i].attrs.y = y
end sub