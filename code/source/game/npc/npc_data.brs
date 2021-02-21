function npc_data() as object

    m.npc = {

        ' attributes
        getHP: npc_getHP
        setHP: npc_setHP


        ' pos

        ' obj
        getObjPosX: npc_getObjPosX
        setObjPosX: npc_setObjPosX
        
        getObjPosY: npc_getObjPosY
        setObjPosY: npc_setObjPosY

        ' col
        getColPosX: npc_getColPosX
        setColPosX: npc_setColPosX
        
        getColPosY: npc_getColPosY
        setColPosY: npc_setColPosY


        ' size

        ' obj
        getObjW: npc_getObjW
        setObjW: npc_setObjW
        
        getObjH: npc_getObjH
        setObjH: npc_setObjH

        ' col
        getColW: npc_getColW
        setColW: npc_setColW
        
        getColH: npc_getObjH
        setColH: npc_setColH


        ' anim
        getAnim: npc_getAnim
        setAnim: npc_setAnim


        config: invalid

    }

    if m.npc.config = invalid

        m.npc.config = []

    end if

    return m.npc

end function



function npc_getObjPosX(id as integer) as integer
    return m.config[id].entity.x
end function

sub npc_setObjPosX(id as integer, x as integer)
    m.config[id].entity.x = x
end sub


function npc_getObjPosY(id as integer) as integer
    return m.config[id].entity.y
end function

sub npc_setObjPosY(id as integer, y as integer)
    m.config[id].entity.y = y
end sub



function npc_getColPosX(id as integer) as integer
    return m.config[id].col.x
end function

sub npc_setColPosX(id as integer, x as integer)
    m.config[id].col.x = x
end sub


function npc_getColPosY(id as integer) as integer
    return m.config[id].col.y
end function

sub npc_setColPosY(id as integer, y as integer)
    m.config[id].col.y = y
end sub



function npc_getObjW(id as integer) as integer
    return m.config[id].entity.width
end function

sub npc_setObjW(id as integer, width as integer)
    m.config[id].entity.width = width
end sub


function npc_getObjH(id as integer) as integer
    return m.config[id].entity.height
end function

sub npc_setObjH(id as integer, height as integer)
    m.config[id].entity.height = height
end sub



function npc_getColW(id as integer) as integer
    return m.config[id].col.width
end function

sub npc_setColW(id as integer, width as integer)
    m.config[id].col.width = width
end sub


function npc_getColH(id as integer) as integer
    return m.config[id].col.height
end function

sub npc_setColH(id as integer, height as integer)
    m.config[id].col.height = height
end sub



function npc_getHP(id as integer) as integer
    return m.config[id].attributes.hp
end function


sub npc_setHP(id as integer, hp as integer)
    m.config[id].attributes.hp = hp
end sub



function npc_getAnim(id as integer) as integer
    return m.config[id].anim.index
end function

sub npc_setAnim(id as integer, index as integer)
    m.config[id].anim.index = index
end sub