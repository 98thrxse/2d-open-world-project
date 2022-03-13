function veh_data() as object

    m.veh = {

        getUpSpeed: veh_getUpSpeed
        setUpSpeed: veh_setUpSpeed

        getDownSpeed: veh_getDownSpeed
        setDownSpeed: veh_setDownSpeed

        getLeftSpeed: veh_getLeftSpeed
        setLeftSpeed: veh_setLeftSpeed

        getRightSpeed: veh_getRightSpeed
        setRightSpeed: veh_setRightSpeed
 
        getName: veh_getName
        setName: veh_setName

        getAnimTime: veh_getAnimTime
        setAnimTime: veh_setAnimTime

        getEntityX: veh_getEntityX
        setEntityX: veh_setEntityX
        
        getEntityY: veh_getEntityY
        setEntityY: veh_setEntityY

        getEntityW: veh_getEntityW
        setEntityW: veh_setEntityW
        
        getEntityH: veh_getEntityH
        setEntityH: veh_setEntityH

        getColX: veh_getColX
        setColX: veh_setColX
        
        getColY: veh_getColY
        setColY: veh_setColY

        getColH: veh_getColH
        setColH: veh_setColH
        
        getColW: veh_getColW
        setColW: veh_setColW

        getIndex: veh_getIndex
        setIndex: veh_setIndex

        getRegElement: veh_getRegElement
        setRegElement: veh_setRegElement

        getReg: veh_getReg
        setReg: veh_setReg

        getScaleX: veh_getScaleX
        setScaleX: veh_setScaleX

        getScaleY: veh_getScaleY
        setScaleY: veh_setScaleY

        config: invalid

    }

    if m.veh.config = invalid

        m.veh.config = []

    end if

    return m.veh

end function

function veh_getName(i as object) as object
    return m.config[i].name
end function

sub veh_setName(i as object, name as object)
    m.config[i].name = name
end sub

function veh_getAnimTime(i as object) as object
    return m.config[i].time
end function

sub veh_setAnimTime(i as object, time as object)
    m.config[i].time = time
end sub

function veh_getEntityX(i as object) as object
    return m.config[i].entity.x
end function

sub veh_setEntityX(i as object, x as object)
    m.config[i].entity.x = x
end sub

function veh_getEntityY(i as object) as object
    return m.config[i].entity.y
end function

sub veh_setEntityY(i as object, y as object)
    m.config[i].entity.y = y
end sub

function veh_getEntityW(i as object) as object
    return m.config[i].entity.width
end function

sub veh_setEntityW(i as object, width as object)
    m.config[i].entity.width = width
end sub

function veh_getEntityH(i as object) as object
    return m.config[i].entity.height
end function

sub veh_setEntityH(i as object, height as object)
    m.config[i].entity.height = height
end sub

function veh_getIndex(i as object) as object
    return m.config[i].index
end function

sub veh_setIndex(i as object, index as object)
    m.config[i].index = index
end sub

function veh_getRegElement(i as object, j as object) as object
    return m.config[i].reg[j]
end function

sub veh_setRegElement(i as object, j as object, reg as object)
    m.config[i].reg[j] = reg
end sub

function veh_getReg(i as object) as object
    return m.config[i].reg
end function

sub veh_setReg(i as object, reg as object)
    m.config[i].reg = reg
end sub

function veh_getScaleX(i as object) as object
    return m.config[i].scale.x
end function

sub veh_setScaleX(i as object, x as object)
    m.config[i].scale.x = x
end sub

function veh_getScaleY(i as object) as object
    return m.config[i].scale.y
end function

sub veh_setScaleY(i as object, y as object)
    m.config[i].scale.y = y
end sub

function veh_getUpSpeed(i as object) as object
    return m.config[i].speed.up
end function

sub veh_setUpSpeed(i as object, speed as object) 
    m.config[i].speed.up = speed
end sub

function veh_getDownSpeed(i as object) as object
    return m.config[i].speed.down
end function

sub veh_setDownSpeed(i as object, speed as object) 
    m.config[i].speed.down = speed
end sub

function veh_getLeftSpeed(i as object) as object
    return m.config[i].speed.left
end function

sub veh_setLeftSpeed(i as object, speed as object) 
    m.config[i].speed.left = speed
end sub

function veh_getRightSpeed(i as object) as object
    return m.config[i].speed.right
end function

sub veh_setRightSpeed(i as object, speed as object) 
    m.config[i].speed.right = speed
end sub

function veh_getVehCol(i as object) as object
    return m.config[i].col.veh
end function

sub veh_setVehCol(i as object, j as object) 
    m.config[i].col.veh = j
end sub

function veh_getColX(i as object) as object
    return m.config[i].col.x
end function

sub veh_setColX(i as object, x as object)
    m.config[i].col.x = x
end sub

function veh_getColY(i as object) as object
    return m.config[i].col.y
end function

sub veh_setColY(i as object, y as object)
    m.config[i].col.y = y
end sub

function veh_getColH(i as object) as object
    return m.config[i].col.height
end function

sub veh_setColH(i as object, height as object)
    m.config[i].col.height = height
end sub

function veh_getColW(i as object) as object
    return m.config[i].col.width
end function

sub veh_setColW(i as object, width as object)
    m.config[i].col.width = width
end sub