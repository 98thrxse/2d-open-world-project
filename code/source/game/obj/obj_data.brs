function obj_data() as object

    m.obj = {

        ' anim
        getAlpha: obj_getAlpha
        setAlpha: obj_setAlpha

        ' pos

        ' obj
        getObjPosX: obj_getObjPosX
        setObjPosX: obj_setObjPosX
        
        getObjPosY: obj_getObjPosY
        setObjPosY: obj_setObjPosY

        ' col
        getColPosX: obj_getColPosX
        setColPosX: obj_setColPosX
        
        getColPosY: obj_getColPosY
        setColPosY: obj_setColPosY


        ' size

        ' obj
        getObjH: obj_getObjH
        setObjH: obj_setObjH
        
        getObjW: obj_getObjW
        setObjW: obj_setObjW

        ' col
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



function obj_getObjPosX(id as integer) as integer
    return m.config[id].obj.x
end function

sub obj_setObjPosX(id as integer, x as integer)
    m.config[id].obj.x = x
end sub


function obj_getObjPosY(id as integer) as integer
    return m.config[id].obj.y
end function

sub obj_setObjPosY(id as integer, y as integer)
    m.config[id].obj.y = y
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



function obj_getObjH(id as integer) as integer
    return m.config[id].obj.height
end function

sub obj_setObjH(id as integer, height as integer)
    m.config[id].obj.height = height
    SaveGame(m._params)
end sub


function obj_getObjW(id as integer) as integer
    return m.config[id].obj.width
end function

sub obj_setObjW(id as integer, width as integer)
    m.config[id].obj.width = width
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