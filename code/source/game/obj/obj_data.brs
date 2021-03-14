function obj_data() as object

    m.obj = {

        ' anim
        getAlpha: obj_getAlpha
        setAlpha: obj_setAlpha


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



function obj_getAlpha(id as integer) as integer
    return m.config[id].anim.alpha
end function

sub obj_setAlpha(id as integer, alpha as integer)
    m.config[id].anim.alpha = alpha
end sub


function obj_getColName(id as integer) as integer
    return m.config[id].col.name
end function

sub obj_setColName(id as integer, name as string)
    m.config[id].col.name = name
end sub


function obj_getEntityName(id as integer) as integer
    return m.config[id].entity.name
end function

sub obj_setEntityName(id as integer, name as string)
    m.config[id].entity.name = name
end sub


function obj_getEntityPosX(id as integer) as integer
    return m.config[id].entity.x
end function

sub obj_setEntityPosX(id as integer, x as integer)
    m.config[id].entity.x = x
end sub


function obj_getEntityPosY(id as integer) as integer
    return m.config[id].entity.y
end function

sub obj_setEntityPosY(id as integer, y as integer)
    m.config[id].entity.y = y
end sub



function obj_getColPosX(id as integer) as integer
    return m.config[id].col.x
end function

sub obj_setColPosX(id as integer, x as integer)
    m.config[id].col.x = x
end sub


function obj_getColPosY(id as integer) as integer
    return m.config[id].col.y
end function

sub obj_setColPosY(id as integer, y as integer)
    m.config[id].col.y = y
end sub



function obj_getEntityH(id as integer) as integer
    return m.config[id].entity.height
end function

sub obj_setEntityH(id as integer, height as integer)
    m.config[id].entity.height = height
    SaveGame(m._params)
end sub


function obj_getEntityW(id as integer) as integer
    return m.config[id].entity.width
end function

sub obj_setEntityW(id as integer, width as integer)
    m.config[id].entity.width = width
    SaveGame(m._params)
end sub



function obj_getColH(id as integer) as integer
    return m.config[id].col.height
end function

sub obj_setColH(id as integer, height as integer)
    m.config[id].col.height = height
    SaveGame(m._params)
end sub


function obj_getColW(id as integer) as integer
    return m.config[id].col.width
end function

sub obj_setColW(id as integer, width as integer)
    m.config[id].col.width = width
    SaveGame(m._params)
end sub