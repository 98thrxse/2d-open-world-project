function npc_data() as object

    m.npc = {

        ' attrs
        getHP: npc_getHP
        setHP: npc_setHP

        getPath: npc_getPath
        setPath: npc_setPath

        getPathX: npc_getPathX
        setPathX: npc_setPathX

        getPathY: npc_getPathY
        setPathY: npc_setPathY
        
        getPathCycle: npc_getPathCycle
        setPathCycle: npc_setPathCycle
 
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

        getScaleX: npc_getScaleX
        setScaleX: npc_setScaleX

        getScaleY: npc_getScaleY
        setScaleY: npc_setScaleY

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
    return m.config[i].entity.offset.x
end function

sub npc_setEntityOffsetX(i as object, x as object)
    m.config[i].entity.offset.x = x
end sub


function npc_getEntityOffsetY(i as object) as object
    return m.config[i].entity.offset.y
end function

sub npc_setEntityOffsetY(i as object, y as object)
    m.config[i].entity.offset.y = y
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
    return m.config[i].entity.index
end function

sub npc_setIndex(i as object, index as object)
    m.config[i].entity.index = index
end sub


function npc_getReg(i as object, j as object) as object
    return m.config[i].entity.reg[j]
end function

sub npc_setReg(i as object, j as object, reg as object)
    m.config[i].entity.reg[j] = reg
end sub

function npc_getAnimTime(i as object) as object
    return m.config[i].entity.time
end function

sub npc_setAnimTime(i as object, time as object)
    m.config[i].entity.time = time
end sub

function npc_getPath(i as object) as object
    return m.config[i].attrs.path.position
end function

sub npc_setPath(i as object, position as object)
    m.config[i].attrs.path.position = position
end sub

function npc_getPathX(i as object, j as object) as object
    return m.config[i].attrs.path.position[j][0]
end function

sub npc_setPathX(i as object, j as object, x as object)
    m.config[i].attrs.path.position[j][0] = x
end sub

function npc_getPathY(i as object, j as object) as object
    return m.config[i].attrs.path.position[j][1]
end function

sub npc_setPathY(i as object, j as object, y as object)
    m.config[i].attrs.path.position[j][1] = y
end sub

function npc_getPathCycle(i as object) as object
    return m.config[i].attrs.path.cycle
end function

sub npc_setPathCycle(i as object, cycle as object)
    m.config[i].attrs.path.cycle = cycle
end sub

function npc_getScaleX(i as object) as object
    return m.config[i].entity.scale.x
end function

sub npc_setScaleX(i as object, x as object)
    m.config[i].entity.scale.x = x
end sub

function npc_getScaleY(i as object) as object
    return m.config[i].entity.scale.y
end function

sub npc_setScaleY(i as object, y as object)
    m.config[i].entity.scale.y = y
end sub