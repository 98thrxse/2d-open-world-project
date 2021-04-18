function npc_data() as object

    m.npc = {

        ' attrs
        getHP: npc_getHP
        setHP: npc_setHP

        ' entity
        getEntityName: npc_getEntityName
        setEntityName: npc_setEntityName

        getEntityOffsetX: npc_getEntityOffsetX
        setEntityOffsetX: npc_setEntityOffsetX
        
        getEntityOffsetY: npc_getEntityOffsetY
        setEntityOffsetY: npc_setEntityOffsetY

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

        getColOffsetX: npc_getColOffsetX
        setColOffsetX: npc_setColOffsetX
        
        getColOffsetY: npc_getColOffsetY
        setColOffsetY: npc_setColOffsetY

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


function npc_getEntityName(i as integer) as object
    return m.config[i].entity.name
end function

sub npc_setEntityName(i as integer, name as string)
    m.config[i].entity.name = name
end sub


function npc_getEntityOffsetX(i as integer) as integer
    return m.config[i].entity.anim.offset.x
end function

sub npc_setEntityOffsetX(i as integer, x as integer)
    m.config[i].entity.anim.offset.x = x
end sub


function npc_getEntityOffsetY(i as integer) as integer
    return m.config[i].entity.anim.offset.y
end function

sub npc_setEntityOffsetY(i as integer, y as integer)
    m.config[i].entity.anim.offset.y = y
end sub



function npc_getColOffsetX(i as integer) as integer
    return m.config[i].col.offset.x
end function

sub npc_setColOffsetX(i as integer, x as integer)
    m.config[i].col.offset.x = x
end sub


function npc_getColOffsetY(i as integer) as integer
    return m.config[i].col.offset.y
end function

sub npc_setColOffsetY(i as integer, y as integer)
    m.config[i].col.offset.y = y
end sub



function npc_getEntityW(i as integer) as integer
    return m.config[i].entity.size.width
end function

sub npc_setEntityW(i as integer, width as integer)
    m.config[i].entity.size.width = width
end sub


function npc_getEntityH(i as integer) as integer
    return m.config[i].entity.size.height
end function

sub npc_setEntityH(i as integer, height as integer)
    m.config[i].entity.size.height = height
end sub



function npc_getColW(i as integer) as integer
    return m.config[i].col.size.width
end function

sub npc_setColW(i as integer, width as integer)
    m.config[i].col.size.width = width
end sub


function npc_getColH(i as integer) as integer
    return m.config[i].col.size.height
end function

sub npc_setColH(i as integer, height as integer)
    m.config[i].col.size.height = height
end sub



function npc_getHP(i as integer) as integer
    return m.config[i].attrs.hp
end function


sub npc_setHP(i as integer, hp as integer)
    m.config[i].attrs.hp = hp
end sub



function npc_getIndex(i as integer) as integer
    return m.config[i].entity.anim.index
end function

sub npc_setIndex(i as integer, index as integer)
    m.config[i].entity.anim.index = index
end sub


function npc_getReg(i as integer, j as integer) as object
    return m.config[i].entity.anim.reg[j]
end function

sub npc_setReg(i as integer, j as integer, reg as object)
    m.config[i].entity.anim.reg[j] = reg
end sub