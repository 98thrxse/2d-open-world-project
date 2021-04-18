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



function obj_getAlpha(i as integer) as integer
    return m.config[i].entity.anim.alpha
end function

sub obj_setAlpha(i as integer, alpha as integer)
    m.config[i].entity.anim.alpha = alpha
end sub


function obj_getReg(i as integer, j as integer) as object
    return m.config[i].entity.anim.reg[j]
end function

sub obj_setReg(i as integer, j as integer, reg as object)
    m.config[i].entity.anim.reg[j] = reg
end sub


function obj_getColName(i as integer) as object
    return m.config[i].col.name
end function

sub obj_setColName(i as integer, name as string)
    m.config[i].col.name = name
end sub


function obj_getEntityName(i as integer) as object
    return m.config[i].entity.name
end function

sub obj_setEntityName(i as integer, name as string)
    m.config[i].entity.name = name
end sub


function obj_getEntityOffsetX(i as integer) as integer
    return m.config[i].entity.anim.offset.x
end function

sub obj_setEntityOffsetX(i as integer, x as integer)
    m.config[i].entity.anim.offset.x = x
end sub


function obj_getEntityOffsetY(i as integer) as integer
    return m.config[i].entity.anim.offset.y
end function

sub obj_setEntityOffsetY(i as integer, y as integer)
    m.config[i].entity.anim.offset.y = y
end sub



function obj_getColOffsetX(i as integer) as integer
    return m.config[i].col.offset.x
end function

sub obj_setColOffsetX(i as integer, x as integer)
    m.config[i].col.offset.x = x
end sub

function obj_getColOffsetY(i as integer) as integer
    return m.config[i].col.offset.y
end function

sub obj_setColOffsetY(i as integer, y as integer)
    m.config[i].col.offset.y = y
end sub


function obj_getEntityH(i as integer) as integer
    return m.config[i].entity.size.height
end function

sub obj_setEntityH(i as integer, height as integer)
    m.config[i].entity.size.height = height
end sub


function obj_getEntityW(i as integer) as integer
    return m.config[i].entity.size.width
end function

sub obj_setEntityW(i as integer, width as integer)
    m.config[i].entity.size.width = width
end sub



function obj_getColH(i as integer) as integer
    return m.config[i].col.size.height
end function

sub obj_setColH(i as integer, height as integer)
    m.config[i].col.size.height = height
end sub


function obj_getColW(i as integer) as integer
    return m.config[i].col.size.width
end function

sub obj_setColW(i as integer, width as integer)
    m.config[i].col.size.width = width
end sub