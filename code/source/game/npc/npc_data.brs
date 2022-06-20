function npc_data() as object

    m.npc = {

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

        getUpSpeed: npc_getUpSpeed
        setUpSpeed: npc_setUpSpeed

        getDownSpeed: npc_getDownSpeed
        setDownSpeed: npc_setDownSpeed

        getLeftSpeed: npc_getLeftSpeed
        setLeftSpeed: npc_setLeftSpeed

        getRightSpeed: npc_getRightSpeed
        setRightSpeed: npc_setRightSpeed
 
        getName: npc_getName
        setName: npc_setName

        getOffsetX: npc_getOffsetX
        setOffsetX: npc_setOffsetX
        
        getOffsetY: npc_getOffsetY
        setOffsetY: npc_setOffsetY

        getSizeW: npc_getSizeW
        setSizeW: npc_setSizeW
        
        getSizeH: npc_getSizeH
        setSizeH: npc_setSizeH

        getIndex: npc_getIndex
        setIndex: npc_setIndex

        getRegElement: npc_getRegElement
        setRegElement: npc_setRegElement

        getReg: npc_getReg
        setReg: npc_setReg

        getAnimTime: npc_getAnimTime
        setAnimTime: npc_setAnimTime

        getScaleX: npc_getScaleX
        setScaleX: npc_setScaleX

        getScaleY: npc_getScaleY
        setScaleY: npc_setScaleY

        getAlpha: npc_getAlpha
        setAlpha: npc_setAlpha

        config: invalid

    }

    if m.npc.config = invalid

        m.npc.config = []

    end if

    return m.npc

end function


function npc_getName(i as object) as object
    return m.config[i].name
end function

sub npc_setName(i as object, name as object)
    m.config[i].name = name
end sub


function npc_getOffsetX(i as object) as object
    return m.config[i].offset.x
end function

sub npc_setOffsetX(i as object, x as object)
    m.config[i].offset.x = x
end sub


function npc_getOffsetY(i as object) as object
    return m.config[i].offset.y
end function

sub npc_setOffsetY(i as object, y as object)
    m.config[i].offset.y = y
end sub



function npc_getSizeW(i as object) as object
    return m.config[i].size.width
end function

sub npc_setSizeW(i as object, width as object)
    m.config[i].size.width = width
end sub


function npc_getSizeH(i as object) as object
    return m.config[i].size.height
end function

sub npc_setSizeH(i as object, height as object)
    m.config[i].size.height = height
end sub


function npc_getHP(i as object) as object
    return m.config[i].hp
end function


sub npc_setHP(i as object, hp as object)
    m.config[i].hp = hp
end sub



function npc_getIndex(i as object) as object
    return m.config[i].index
end function

sub npc_setIndex(i as object, index as object)
    m.config[i].index = index
end sub


function npc_getRegElement(i as object, j as object) as object
    return m.config[i].reg[j]
end function

sub npc_setRegElement(i as object, j as object, reg as object)
    m.config[i].reg[j] = reg
end sub

function npc_getReg(i as object) as object
    return m.config[i].reg
end function

sub npc_setReg(i as object, reg as object)
    m.config[i].reg = reg
end sub

function npc_getAnimTime(i as object) as object
    return m.config[i].time
end function

sub npc_setAnimTime(i as object, time as object)
    m.config[i].time = time
end sub

function npc_getPath(i as object) as object
    return m.config[i].path.position
end function

sub npc_setPath(i as object, position as object)
    m.config[i].path.position = position
end sub

function npc_getPathX(i as object, j as object) as object
    return m.config[i].path.position[j][0]
end function

sub npc_setPathX(i as object, j as object, x as object)
    m.config[i].path.position[j][0] = x
end sub

function npc_getPathY(i as object, j as object) as object
    return m.config[i].path.position[j][1]
end function

sub npc_setPathY(i as object, j as object, y as object)
    m.config[i].path.position[j][1] = y
end sub

function npc_getPathCycle(i as object) as object
    return m.config[i].path.cycle
end function

sub npc_setPathCycle(i as object, cycle as object)
    m.config[i].path.cycle = cycle
end sub

function npc_getScaleX(i as object) as object
    return m.config[i].scale.x
end function

sub npc_setScaleX(i as object, x as object)
    m.config[i].scale.x = x
end sub

function npc_getScaleY(i as object) as object
    return m.config[i].scale.y
end function

sub npc_setScaleY(i as object, y as object)
    m.config[i].scale.y = y
end sub

function npc_getUpSpeed(i as object) as object
    return m.config[i].speed.up
end function

sub npc_setUpSpeed(i as object, speed as object) 
    m.config[i].speed.up = speed
end sub


function npc_getDownSpeed(i as object) as object
    return m.config[i].speed.down
end function

sub npc_setDownSpeed(i as object, speed as object) 
    m.config[i].speed.down = speed
end sub


function npc_getLeftSpeed(i as object) as object
    return m.config[i].speed.left
end function

sub npc_setLeftSpeed(i as object, speed as object) 
    m.config[i].speed.left = speed
end sub


function npc_getRightSpeed(i as object) as object
    return m.config[i].speed.right
end function

sub npc_setRightSpeed(i as object, speed as object) 
    m.config[i].speed.right = speed
end sub


function npc_getAlpha(i as object) as object
    return m.config[i].alpha
end function

sub npc_setAlpha(i as object, alpha as object) 
    m.config[i].alpha = alpha
end sub