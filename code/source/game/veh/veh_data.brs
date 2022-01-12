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
 
        getEntityName: veh_getEntityName
        setEntityName: veh_setEntityName

        getAnimTime: veh_getAnimTime
        setAnimTime: veh_setAnimTime

        getOffsetX: veh_getOffsetX
        setOffsetX: veh_setOffsetX
        
        getOffsetY: veh_getOffsetY
        setOffsetY: veh_setOffsetY

        getSizeW: veh_getSizeW
        setSizeW: veh_setSizeW
        
        getSizeH: veh_getSizeH
        setSizeH: veh_setSizeH

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

        getColUpName: veh_getColUpName
        setColUpName: veh_setColUpName

        getColDownName: veh_getColDownName
        setColDownName: veh_setColDownName

        getColLeftName: veh_getColLeftName
        setColLeftName: veh_setColLeftName

        getColRightName: veh_getColRightName
        setColRightName: veh_setColRightName

        getNPCCol: veh_getNPCCol
        setNPCCol: veh_setNPCCol

        getVehCol: veh_getVehCol
        setVehCol: veh_setVehCol

        getMarkerCol: veh_getMarkerCol
        setMarkerCol: veh_setMarkerCol

        getColUp: veh_getColUp
        setColUp: veh_setColUp

        getColDown: veh_getColDown
        setColDown: veh_setColDown

        getColLeft: veh_getColLeft
        setColLeft: veh_setColLeft

        getColRight: veh_getColRight
        setColRight: veh_setColRight

        config: invalid

    }

    if m.veh.config = invalid

        m.veh.config = []

    end if

    return m.veh

end function


function veh_getEntityName(i as object) as object
    return m.config[i].name
end function

sub veh_setEntityName(i as object, name as object)
    m.config[i].name = name
end sub

function veh_getColUpName(i as object) as object
    return m.config[i].name_up
end function

sub veh_setColUpName(i as object, name as object)
    m.config[i].name_up = name
end sub


function veh_getColDownName(i as object) as object
    return m.config[i].name_down
end function


sub veh_setColDownName(i as object, name as object)
    m.config[i].name_down = name
end sub


function veh_getColLeftName(i as object) as object
    return m.config[i].name_left
end function

sub veh_setColLeftName(i as object, name as object)
    m.config[i].name_left = name
end sub


function veh_getColRightName(i as object) as object
    return m.config[i].name_right
end function

sub veh_setColRightName(i as object, name as object)
    m.config[i].name_right = name
end sub

function veh_getAnimTime(i as object) as object
    return m.config[i].time
end function

sub veh_setAnimTime(i as object, time as object)
    m.config[i].time = time
end sub


function veh_getOffsetX(i as object) as object
    return m.config[i].offset.x
end function

sub veh_setOffsetX(i as object, x as object)
    m.config[i].offset.x = x
end sub


function veh_getOffsetY(i as object) as object
    return m.config[i].offset.y
end function

sub veh_setOffsetY(i as object, y as object)
    m.config[i].offset.y = y
end sub



function veh_getSizeW(i as object) as object
    return m.config[i].size.width
end function

sub veh_setSizeW(i as object, width as object)
    m.config[i].size.width = width
end sub


function veh_getSizeH(i as object) as object
    return m.config[i].size.height
end function

sub veh_setSizeH(i as object, height as object)
    m.config[i].size.height = height
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

function veh_getNPCCol(i as object) as object
    return m.config[i].col.npc
end function

sub veh_setNPCCol(i as object, j as object) 
    m.config[i].col.npc = j
end sub

function veh_getMarkerCol(i as object) as object
    return m.config[i].col.marker
end function

sub veh_setMarkerCol(i as object, j as object) 
    m.config[i].col.marker = j
end sub


function veh_getColUp(i as object) as object
    return m.config[i].col.up
end function

sub veh_setColUp(i as object, col as object) 
    m.config[i].col.up = col
end sub


function veh_getColDown(i as object) as object
    return m.config[i].col.down
end function

sub veh_setColDown(i as object, col as object) 
    m.config[i].col.down = col
end sub


function veh_getColLeft(i as object) as object
    return m.config[i].col.left
end function

sub veh_setColLeft(i as object, col as object) 
    m.config[i].col.left = col
end sub


function veh_getColRight(i as object) as object
    return m.config[i].col.right
end function

sub veh_setColRight(i as object, col as object) 
    m.config[i].col.right = col
end sub