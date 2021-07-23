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

        getAnimTime: npc_getAnimTime
        setAnimTime: npc_setAnimTime

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



function npc_getColName(i as object) as object
    return m.config[i].col.name
end function

sub npc_setColName(i as object, name as object)
    m.config[i].col.name = name
end sub


function npc_getEntityName(i as object) as object
    return m.config[i].entity.name
end function

sub npc_setEntityName(i as object, name as object)
    m.config[i].entity.name = name
end sub


function npc_getEntityOffsetX(i as object) as object
    return m.config[i].entity.anim.offset.x
end function

sub npc_setEntityOffsetX(i as object, x as object)
    m.config[i].entity.anim.offset.x = x
end sub


function npc_getEntityOffsetY(i as object) as object
    return m.config[i].entity.anim.offset.y
end function

sub npc_setEntityOffsetY(i as object, y as object)
    m.config[i].entity.anim.offset.y = y
end sub



function npc_getColOffsetX(i as object) as object
    return m.config[i].col.offset.x
end function

sub npc_setColOffsetX(i as object, x as object)
    m.config[i].col.offset.x = x
end sub


function npc_getColOffsetY(i as object) as object
    return m.config[i].col.offset.y
end function

sub npc_setColOffsetY(i as object, y as object)
    m.config[i].col.offset.y = y
end sub



function npc_getEntityW(i as object) as object
    return m.config[i].entity.size.width
end function

sub npc_setEntityW(i as object, width as object)
    m.config[i].entity.size.width = width
end sub


function npc_getEntityH(i as object) as object
    return m.config[i].entity.size.height
end function

sub npc_setEntityH(i as object, height as object)
    m.config[i].entity.size.height = height
end sub



function npc_getColW(i as object) as object
    return m.config[i].col.size.width
end function

sub npc_setColW(i as object, width as object)
    m.config[i].col.size.width = width
end sub


function npc_getColH(i as object) as object
    return m.config[i].col.size.height
end function

sub npc_setColH(i as object, height as object)
    m.config[i].col.size.height = height
end sub



function npc_getHP(i as object) as object
    return m.config[i].attrs.hp
end function


sub npc_setHP(i as object, hp as object)
    m.config[i].attrs.hp = hp
end sub



function npc_getIndex(i as object) as object
    return m.config[i].entity.anim.index
end function

sub npc_setIndex(i as object, index as object)
    m.config[i].entity.anim.index = index
end sub


function npc_getReg(i as object, j as object) as object
    return m.config[i].entity.anim.reg[j]
end function

sub npc_setReg(i as object, j as object, reg as object)
    m.config[i].entity.anim.reg[j] = reg
end sub

function npc_getAnimTime(i as object) as object
    return m.config[i].entity.anim.time
end function

sub npc_setAnimTime(i as object, time as object)
    m.config[i].entity.anim.time = time
end sub