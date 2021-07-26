function obj_data() as object

    m.obj = {

        ' entity
        getEntityName: obj_getEntityName
        setEntityName: obj_setEntityName

        getEntityOffsetX: obj_getEntityOffsetX
        setEntityOffsetX: obj_setEntityOffsetX
        
        getEntityOffsetY: npc_getEntityOffsetY
        setEntityOffsetY: npc_setEntityOffsetY

        getEntityH: obj_getEntityH
        setEntityH: obj_setEntityH
        
        getEntityW: obj_getEntityW
        setEntityW: obj_setEntityW

        getAlpha: obj_getAlpha
        setAlpha: obj_setAlpha

        getReg: obj_getReg
        setReg: obj_setReg

        ' col
        getColName: obj_getColName
        setColName: obj_setColName

        getColOffsetX: obj_getColOffsetX
        setColOffsetX: obj_setColOffsetX
        
        getColOffsetY: obj_getColOffsetY
        setColOffsetY: obj_setColOffsetY

        getColH: obj_getColH
        setColH: obj_setColH
        
        getColW: obj_getColW
        setColW: obj_setColW


        config: invalid

    }

    if m.obj.config = invalid

        m.obj.config = []

    end if

    return m.obj

end function



function obj_getAlpha(i as object) as object
    return m.config[i].entity.alpha
end function

sub obj_setAlpha(i as object, alpha as object)
    m.config[i].entity.alpha = alpha
end sub


function obj_getReg(i as object, j as object) as object
    return m.config[i].entity.reg[j]
end function

sub obj_setReg(i as object, j as object, reg as object)
    m.config[i].entity.reg[j] = reg
end sub


function obj_getColName(i as object) as object
    return m.config[i].col.name
end function

sub obj_setColName(i as object, name as object)
    m.config[i].col.name = name
end sub


function obj_getEntityName(i as object) as object
    return m.config[i].entity.name
end function

sub obj_setEntityName(i as object, name as object)
    m.config[i].entity.name = name
end sub


function obj_getEntityOffsetX(i as object) as object
    return m.config[i].entity.offset.x
end function

sub obj_setEntityOffsetX(i as object, x as object)
    m.config[i].entity.offset.x = x
end sub


function obj_getEntityOffsetY(i as object) as object
    return m.config[i].entity.offset.y
end function

sub obj_setEntityOffsetY(i as object, y as object)
    m.config[i].entity.offset.y = y
end sub



function obj_getColOffsetX(i as object) as object
    return m.config[i].col.offset.x
end function

sub obj_setColOffsetX(i as object, x as object)
    m.config[i].col.offset.x = x
end sub

function obj_getColOffsetY(i as object) as object
    return m.config[i].col.offset.y
end function

sub obj_setColOffsetY(i as object, y as object)
    m.config[i].col.offset.y = y
end sub


function obj_getEntityH(i as object) as object
    return m.config[i].entity.size.height
end function

sub obj_setEntityH(i as object, height as object)
    m.config[i].entity.size.height = height
end sub


function obj_getEntityW(i as object) as object
    return m.config[i].entity.size.width
end function

sub obj_setEntityW(i as object, width as object)
    m.config[i].entity.size.width = width
end sub



function obj_getColH(i as object) as object
    return m.config[i].col.size.height
end function

sub obj_setColH(i as object, height as object)
    m.config[i].col.size.height = height
end sub


function obj_getColW(i as object) as object
    return m.config[i].col.size.width
end function

sub obj_setColW(i as object, width as object)
    m.config[i].col.size.width = width
end sub