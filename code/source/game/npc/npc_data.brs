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



function npc_getColName(i as integer) as integer
    return m.config[i].col.name
end function

sub npc_setColName(i as integer, name as string)
    m.config[i].col.name = name
end sub


function npc_getEntityName(i as integer) as integer
    return m.config[i].entity.name
end function

sub npc_setEntityName(i as integer, name as string)
    m.config[i].entity.name = name
end sub


function npc_getEntityPosX(i as integer) as integer
    return m.config[i].entity.x
end function

sub npc_setEntityPosX(i as integer, x as integer)
    m.config[i].entity.x = x
end sub


function npc_getEntityPosY(i as integer) as integer
    return m.config[i].entity.y
end function

sub npc_setEntityPosY(i as integer, y as integer)
    m.config[i].entity.y = y
end sub



function npc_getColPosX(i as integer) as integer
    return m.config[i].col.x
end function

sub npc_setColPosX(i as integer, x as integer)
    m.config[i].col.x = x
end sub


function npc_getColPosY(i as integer) as integer
    return m.config[i].col.y
end function

sub npc_setColPosY(i as integer, y as integer)
    m.config[i].col.y = y
end sub



function npc_getEntityW(i as integer) as integer
    return m.config[i].entity.width
end function

sub npc_setEntityW(i as integer, width as integer)
    m.config[i].entity.width = width
end sub


function npc_getEntityH(i as integer) as integer
    return m.config[i].entity.height
end function

sub npc_setEntityH(i as integer, height as integer)
    m.config[i].entity.height = height
end sub



function npc_getColW(i as integer) as integer
    return m.config[i].col.width
end function

sub npc_setColW(i as integer, width as integer)
    m.config[i].col.width = width
end sub


function npc_getColH(i as integer) as integer
    return m.config[i].col.height
end function

sub npc_setColH(i as integer, height as integer)
    m.config[i].col.height = height
end sub



function npc_getHP(i as integer) as integer
    return m.config[i].attributes.hp
end function


sub npc_setHP(i as integer, hp as integer)
    m.config[i].attributes.hp = hp
end sub



function npc_getIndex(i as integer) as integer
    return m.config[i].entity.anim.index
end function

sub npc_setIndex(i as integer, index as integer)
    m.config[i].entity.anim.index = index
end sub


function npc_getReg(i as integer) as object
    return m.config[i].entity.anim.reg
end function

sub npc_setReg(i as integer, reg as object)
    m.config[i].entity.anim.reg = reg
end sub