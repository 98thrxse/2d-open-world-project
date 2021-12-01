function obj_data() as object

    m.obj = {

        getName: obj_getName
        setName: obj_setName

        getColX: obj_getColX
        setColX: obj_setColX
        
        getColY: obj_getColY
        setColY: obj_setColY

        getColH: obj_getColH
        setColH: obj_setColH
        
        getColW: obj_getColW
        setColW: obj_setColW

        getEntityX: obj_getEntityX
        setEntityX: obj_setEntityX
        
        getEntityY: obj_getEntityY
        setEntityY: obj_setEntityY

        getEntityH: obj_getEntityH
        setEntityH: obj_setEntityH
        
        getEntityW: obj_getEntityW
        setEntityW: obj_setEntityW

        getAlpha: obj_getAlpha
        setAlpha: obj_setAlpha

        getRegElement: obj_getRegElement
        setRegElement: obj_setRegElement

        getReg: obj_getReg
        setReg: obj_setReg

        getIndex: obj_getIndex
        setIndex: obj_setIndex

        config: invalid

    }

    if m.obj.config = invalid

        m.obj.config = []

    end if

    return m.obj

end function



function obj_getAlpha(i as object) as object
    return m.config[i].alpha
end function

sub obj_setAlpha(i as object, alpha as object)
    m.config[i].alpha = alpha
end sub


function obj_getRegElement(i as object, j as object) as object
    return m.config[i].reg[j]
end function

sub obj_setRegElement(i as object, j as object, reg as object)
    m.config[i].reg[j] = reg
end sub


function obj_getReg(i as object) as object
    return m.config[i].reg
end function

sub obj_setReg(i as object, reg as object)
    m.config[i].reg = reg
end sub


function obj_getName(i as object) as object
    return m.config[i].name
end function

sub obj_setName(i as object, name as object)
    m.config[i].name = name
end sub


function obj_getColX(i as object) as object
    return m.config[i].col.x
end function

sub obj_setColX(i as object, x as object)
    m.config[i].col.x = x
end sub


function obj_getColY(i as object) as object
    return m.config[i].col.y
end function

sub obj_setColY(i as object, y as object)
    m.config[i].col.y = y
end sub


function obj_getColH(i as object) as object
    return m.config[i].col.height
end function

sub obj_setColH(i as object, height as object)
    m.config[i].col.height = height
end sub


function obj_getColW(i as object) as object
    return m.config[i].col.width
end function

sub obj_setColW(i as object, width as object)
    m.config[i].col.width = width
end sub

function obj_getEntityX(i as object) as object
    return m.config[i].entity.x
end function

sub obj_setEntityX(i as object, x as object)
    m.config[i].entity.x = x
end sub


function obj_getEntityY(i as object) as object
    return m.config[i].entity.y
end function

sub obj_setEntityY(i as object, y as object)
    m.config[i].entity.y = y
end sub


function obj_getEntityH(i as object) as object
    return m.config[i].entity.height
end function

sub obj_setEntityH(i as object, height as object)
    m.config[i].entity.height = height
end sub


function obj_getEntityW(i as object) as object
    return m.config[i].entity.width
end function

sub obj_setEntityW(i as object, width as object)
    m.config[i].entity.width = width
end sub


function obj_getIndex(i as object) as object
    return m.config[i].index
end function

sub obj_setIndex(i as object, index as object)
    m.config[i].index = index
end sub