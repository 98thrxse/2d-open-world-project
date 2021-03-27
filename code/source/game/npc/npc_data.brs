function npc_data() as object

    m.npc = {

        ' attributes
        getHP: npc_getHP
        setHP: npc_setHP

        ' entity
        getEntityName: npc_getEntityName
        setEntityName: npc_setEntityName

        getEntityPosX: npc_getEntityPosX
        setEntityPosX: npc_setEntityPosX
        
        getEntityPosY: npc_getEntityPosY
        setEntityPosY: npc_setEntityPosY

        getEntityW: npc_getEntityW
        setEntityW: npc_setEntityW
        
        getEntityH: npc_getEntityH
        setEntityH: npc_setEntityH

        getIndex: npc_getIndex
        setIndex: npc_setIndex

        getReg: npc_getReg
        setReg: npc_setReg

        ' col
        getColName: npc_getColName
        setColName: npc_setColName

        getColPosX: npc_getColPosX
        setColPosX: npc_setColPosX
        
        getColPosY: npc_getColPosY
        setColPosY: npc_setColPosY

        getColW: npc_getColW
        setColW: npc_setColW
        
        getColH: npc_getEntityH
        setColH: npc_setColH

        config: invalid

    }

    if m.npc.config = invalid

        m.npc.config = []

    end if

    return m.npc

end function



function npc_getColName(id as integer) as integer
    return m.config[id].col.name
end function

sub npc_setColName(id as integer, name as string)
    m.config[id].col.name = name
end sub


function npc_getEntityName(id as integer) as integer
    return m.config[id].entity.name
end function

sub npc_setEntityName(id as integer, name as string)
    m.config[id].entity.name = name
end sub


function npc_getEntityPosX(id as integer) as integer
    return m.config[id].entity.x
end function

sub npc_setEntityPosX(id as integer, x as integer)
    m.config[id].entity.x = x
end sub


function npc_getEntityPosY(id as integer) as integer
    return m.config[id].entity.y
end function

sub npc_setEntityPosY(id as integer, y as integer)
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



function npc_getEntityW(id as integer) as integer
    return m.config[id].entity.width
end function

sub npc_setEntityW(id as integer, width as integer)
    m.config[id].entity.width = width
end sub


function npc_getEntityH(id as integer) as integer
    return m.config[id].entity.height
end function

sub npc_setEntityH(id as integer, height as integer)
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



function npc_getIndex(id as integer) as integer
    return m.config[id].entity.anim.index
end function

sub npc_setIndex(id as integer, index as integer)
    m.config[id].entity.anim.index = index
end sub


function npc_getReg(i as integer) as object
    return m.config[i].entity.anim.reg
end function

sub npc_setReg(i as integer, reg as object)
    m.config[i].entity.anim.reg = reg
end sub