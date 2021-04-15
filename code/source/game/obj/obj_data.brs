function obj_data() as object

    m.obj = {

        ' entity
        getEntityName: obj_getEntityName
        setEntityName: obj_setEntityName

        getEntityPosX: obj_getEntityPosX
        setEntityPosX: obj_setEntityPosX
        
        getEntityPosY: obj_getEntityPosY
        setEntityPosY: obj_setEntityPosY

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

        getColPosX: obj_getColPosX
        setColPosX: obj_setColPosX
        
        getColPosY: obj_getColPosY
        setColPosY: obj_setColPosY

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


function obj_getReg(i as integer) as object
    return m.config[i].entity.anim.reg
end function

sub obj_setReg(i as integer, reg as object)
    m.config[i].entity.anim.reg = reg
end sub


function obj_getColName(i as integer) as integer
    return m.config[i].col.name
end function

sub obj_setColName(i as integer, name as string)
    m.config[i].col.name = name
end sub


function obj_getEntityName(i as integer) as integer
    return m.config[i].entity.name
end function

sub obj_setEntityName(i as integer, name as string)
    m.config[i].entity.name = name
end sub


function obj_getEntityPosX(i as integer) as integer
    return m.config[i].entity.pos.x
end function

sub obj_setEntityPosX(i as integer, x as integer)
    m.config[i].entity.pos.x = x
end sub


function obj_getEntityPosY(i as integer) as integer
    return m.config[i].entity.pos.y
end function

sub obj_setEntityPosY(i as integer, y as integer)
    m.config[i].entity.pos.y = y
end sub



function obj_getColPosX(i as integer) as integer
    return m.config[i].col.pos.x
end function

sub obj_setColPosX(i as integer, x as integer)
    m.config[i].col.pos.x = x
end sub


function obj_getColPosY(i as integer) as integer
    return m.config[i].col.pos.y
end function

sub obj_setColPosY(i as integer, y as integer)
    m.config[i].col.pos.y = y
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