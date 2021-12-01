function marker_data() as object

    m.marker = {

        getName: marker_getName
        setName: marker_setName

        getAlpha: marker_getAlpha
        setAlpha: marker_setAlpha

        getRegElement: marker_getRegElement
        setRegElement: marker_setRegElement

        getReg: marker_getReg
        setReg: marker_setReg

        getOffsetX: marker_getOffsetX
        setOffsetX: marker_setOffsetX
        
        getOffsetY: marker_getOffsetY
        setOffsetY: marker_setOffsetY

        getSizeH: marker_getSizeH
        setSizeH: marker_setSizeH
        
        getSizeW: marker_getSizeW
        setSizeW: marker_setSizeW

        getIndex: marker_getIndex
        setIndex: marker_setIndex

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

function marker_getName(i as object) as object
    return m.config[i].name
end function

sub marker_setName(i as object, name as object)
    m.config[i].name = name
end sub


function marker_getAlpha(i as object) as object
    return m.config[i].alpha
end function

sub marker_setAlpha(i as object, alpha as object)
    m.config[i].alpha = alpha
end sub


function marker_getRegElement(i as object, j as object) as object
    return m.config[i].reg[j]
end function

sub marker_setRegElement(i as object, j as object, reg as object)
    m.config[i].reg[j] = reg
end sub


function marker_getReg(i as object) as object
    return m.config[i].reg
end function

sub marker_setReg(i as object, reg as object)
    m.config[i].reg = reg
end sub

function marker_getOffsetX(i as object) as object
    return m.config[i].offset.x
end function

sub marker_setOffsetX(i as object, x as object)
    m.config[i].offset.x = x
end sub


function marker_getOffsetY(i as object) as object
    return m.config[i].offset.y
end function

sub marker_setOffsetY(i as object, y as object)
    m.config[i].offset.y = y
end sub


function marker_getSizeH(i as object) as object
    return m.config[i].size.height
end function

sub marker_setSizeH(i as object, height as object)
    m.config[i].size.height = height
end sub

function marker_getSizeW(i as object) as object
    return m.config[i].size.width
end function

sub marker_setSizeW(i as object, width as object)
    m.config[i].size.width = width
end sub

function marker_getIndex(i as object) as object
    return m.config[i].index
end function

sub marker_setIndex(i as object, index as object)
    m.config[i].index = index
end sub

function marker_getMap(i as object) as object
    return m.config[i].transition.name
end function

sub marker_setMap(i as object, name as object)
    m.config[i].transition.name = name
end sub

function marker_getTransitionX(i as object) as object
    return m.config[i].transition.x
end function

sub marker_setTransitionX(i as object, x as object)
    m.config[i].transition.x = x
end sub

function marker_getTransitionY(i as object) as object
    return m.config[i].transition.y
end function

sub marker_setTransitionY(i as object, y as object)
    m.config[i].transition.y = y
end sub