function char_data(ver) as object

    m.char = {

        getEntityName: char_getEntityName
        setEntityName: char_setEntityName

        getEntityX: char_getEntityX
        setEntityX: char_setEntityX
        
        getEntityY: char_getEntityY
        setEntityY: char_setEntityY  

        getSizeH: char_getSizeH
        setSizeH: char_setSizeH
        
        getSizeW: char_getSizeW
        setSizeW: char_setSizeW

        getScaleX: char_getScaleX
        setScaleX: char_setScaleX

        getScaleY: char_getScaleY
        setScaleY: char_setScaleY

        getOffsetX: char_getOffsetX
        setOffsetX: char_setOffsetX

        getOffsetY: char_getOffsetY
        setOffsetY: char_setOffsetY

        getIndex: char_getIndex
        setIndex: char_setIndex

        getAnimTime: char_getAnimTime
        setAnimTime: char_setAnimTime

        getAlpha: char_getAlpha
        setAlpha: char_setAlpha

        getRegElement: char_getRegElement
        setRegElement: char_setRegElement

        getReg: char_getReg
        setReg: char_setReg

        getHP: char_getHP
        setHP: char_setHP

        getSP: char_getSP
        setSP: char_setSP

        getHPDamage: char_getHPDamage
        setHPDamage: char_setHPDamage

        getSPDamage: char_getSPDamage
        setSPDamage: char_setSPDamage

        getHPDamageTime: char_getHPDamageTime
        setHPDamageTime: char_setHPDamageTime

        getSPDamageTime: char_getSPDamageTime
        setSPDamageTime: char_setSPDamageTime

        getHPRegen: char_getHPRegen
        setHPRegen: char_setHPRegen

        getSPRegen: char_getSPRegen
        setSPRegen: char_setSPRegen

        getHPRegenTime: char_getHPRegenTime
        setHPRegenTime: char_setHPRegenTime

        getSPRegenTime: char_getSPRegenTime
        setSPRegenTime: char_setSPRegenTime

        getUpSpeed: char_getUpSpeed
        setUpSpeed: char_setUpSpeed

        getDownSpeed: char_getDownSpeed
        setDownSpeed: char_setDownSpeed

        getLeftSpeed: char_getLeftSpeed
        setLeftSpeed: char_setLeftSpeed

        getRightSpeed: char_getRightSpeed
        setRightSpeed: char_setRightSpeed

        getMap: char_getMap
        setMap: char_setMap

        getColUpName: char_getColUpName
        setColUpName: char_setColUpName

        getColDownName: char_getColDownName
        setColDownName: char_setColDownName

        getColLeftName: char_getColLeftName
        setColLeftName: char_setColLeftName

        getColRightName: char_getColRightName
        setColRightName: char_setColRightName

        getNPCCol: char_getNPCCol
        setNPCCol: char_setNPCCol

        getVehCol: char_getVehCol
        setVehCol: char_setVehCol

        getMarkerCol: char_getMarkerCol
        setMarkerCol: char_setMarkerCol

        getColUp: char_getColUp
        setColUp: char_setColUp

        getColDown: char_getColDown
        setColDown: char_setColDown

        getColLeft: char_getColLeft
        setColLeft: char_setColLeft

        getColRight: char_getColRight
        setColRight: char_setColRight

        getVeh: char_getVeh
        setVeh: char_setVeh

        save: char_save

        config: invalid
    }

    m.char.config = global_load("char")

    if m.char.config = invalid OR m.char.config.version <> ver

        m.char.config = {
            name: invalid,
            name_up: invalid,
            name_down: invalid,
            name_left: invalid,
            name_right: invalid,
            size: {
                width: invalid,
                height: invalid
            },
            index: invalid,
            alpha: invalid,
            reg: invalid
            scale: {
                x: invalid
                y: invalid
            },
            offset: {
                x: invalid,
                y: invalid
            },
            time: invalid
            pos: {
                x: invalid,
                y: invalid
            },
            col: {
                npc: invalid,
                marker: invalid,
                veh: invalid,
                up: invalid,
                down: invalid
                left: invalid,
                right: invalid
            }
            hp: invalid,
            sp: invalid
            damage: {
                hp: invalid,
                sp: invalid,
                hp_time: invalid,
                sp_time: invalid
            },
            regen: {
                hp: invalid,
                sp: invalid,
                hp_time: invalid,
                sp_time: invalid
            },
            speed: {
                up: invalid,
                down: invalid,
                left: invalid,
                right: invalid
            }
            veh: invalid, 
            map: invalid,
            version: ver
        }

    end if
    return m.char

end function


function char_getColUpName() as object
    return m.config.name_up
end function

sub char_setColUpName(name as object)
    m.config.name_up = name
end sub


function char_getColDownName() as object
    return m.config.name_down
end function


sub char_setColDownName(name as object)
    m.config.name_down = name
end sub


function char_getColLeftName() as object
    return m.config.name_left
end function

sub char_setColLeftName(name as object)
    m.config.name_left = name
end sub


function char_getColRightName() as object
    return m.config.name_right
end function

sub char_setColRightName(name as object)
    m.config.name_right = name
end sub


function char_getScaleX() as object
    return m.config.scale.x
end function

sub char_setScaleX(x as object)
    m.config.scale.x = x
end sub

function char_getScaleY() as object
    return m.config.scale.y
end function

sub char_setScaleY(y as object)
    m.config.scale.y = y
end sub


function char_getOffsetX() as object
    return m.config.offset.x
end function

sub char_setOffsetX(x as object)
    m.config.offset.x = x
end sub

function char_getOffsetY() as object
    return m.config.offset.y
end function

sub char_setOffsetY(y as object)
    m.config.offset.y = y
end sub


function char_getEntityName() as object
    return m.config.name
end function

sub char_setEntityName(name as object)
    m.config.name = name
end sub


function char_getEntityX() as object
    return m.config.pos.x
end function

sub char_setEntityX(x as object)
    m.config.pos.x = x
end sub


function char_getEntityY() as object
    return m.config.pos.y
end function

sub char_setEntityY(y as object)
    m.config.pos.y = y
end sub


function char_getSizeH() as object
    return m.config.size.height
end function

sub char_setSizeH(height as object)
    m.config.size.height = height
end sub


function char_getSizeW() as object
    return m.config.size.width
end function

sub char_setSizeW(width as object)
    m.config.size.width = width
end sub


function char_getHP() as object
    return m.config.hp
end function

sub char_setHP(hp as object)
    m.config.hp = hp
end sub


function char_getSP() as object
    return m.config.sp
end function

sub char_setSP(sp as object)
    m.config.sp = sp
end sub


function char_getHPDamage() as object
    return m.config.damage.hp
end function

sub char_setHPDamage(hp as object)
    m.config.damage.hp = hp
end sub


function char_getSPDamage() as object
    return m.config.damage.sp
end function

sub char_setSPDamage(sp as object)
    m.config.damage.sp = sp
end sub


function char_getHPDamageTime() as object
    return m.config.damage.hp_time
end function

sub char_setHPDamageTime(time as object)
    m.config.damage.hp_time = time
end sub

function char_getSPDamageTime() as object
    return m.config.damage.sp_time
end function

sub char_setSPDamageTime(time as object)
    m.config.damage.sp_time = time
end sub



function char_getHPRegen() as object
    return m.config.regen.hp
end function

sub char_setHPRegen(hp as object)
    m.config.regen.hp = hp
end sub


function char_getSPRegen() as object
    return m.config.regen.sp
end function

sub char_setSPRegen(sp as object)
    m.config.regen.sp = sp
end sub


function char_getHPRegenTime() as object
    return m.config.regen.hp_time
end function

sub char_setHPRegenTime(time as object)
    m.config.regen.hp_time = time
end sub

function char_getSPRegenTime() as object
    return m.config.regen.sp_time
end function

sub char_setSPRegenTime(time as object)
    m.config.regen.sp_time = time
end sub



function char_getIndex() as object
    return m.config.index
end function

sub char_setIndex(index as object)
    m.config.index = index
end sub


function char_getAnimTime() as object
    return m.config.time
end function

sub char_setAnimTime(time as object)
    m.config.time = time
end sub


function char_getAlpha() as object
    return m.config.alpha
end function

sub char_setAlpha(alpha as object)
    m.config.alpha = alpha
end sub


function char_getVehCol() as object
    return m.config.col.veh
end function

sub char_setVehCol(i as object) 
    m.config.col.veh = i
end sub

function char_getNPCCol() as object
    return m.config.col.npc
end function

sub char_setNPCCol(i as object) 
    m.config.col.npc = i
end sub

function char_getMarkerCol() as object
    return m.config.col.marker
end function

sub char_setMarkerCol(i as object) 
    m.config.col.marker = i
end sub


function char_getColUp() as object
    return m.config.col.up
end function

sub char_setColUp(col as object) 
    m.config.col.up = col
end sub


function char_getColDown() as object
    return m.config.col.down
end function

sub char_setColDown(col as object) 
    m.config.col.down = col
end sub


function char_getColLeft() as object
    return m.config.col.left
end function

sub char_setColLeft(col as object) 
    m.config.col.left = col
end sub


function char_getColRight() as object
    return m.config.col.right
end function

sub char_setColRight(col as object) 
    m.config.col.right = col
end sub



function char_getUpSpeed() as object
    return m.config.speed.up
end function

sub char_setUpSpeed(speed as object) 
    m.config.speed.up = speed
end sub


function char_getDownSpeed() as object
    return m.config.speed.down
end function

sub char_setDownSpeed(speed as object) 
    m.config.speed.down = speed
end sub


function char_getLeftSpeed() as object
    return m.config.speed.left
end function

sub char_setLeftSpeed(speed as object) 
    m.config.speed.left = speed
end sub


function char_getRightSpeed() as object
    return m.config.speed.right
end function

sub char_setRightSpeed(speed as object) 
    m.config.speed.right = speed
end sub

function char_getRegElement(i as object) as object
    return m.config.reg[i]
end function

sub char_setRegElement(i as object, reg as object)
    m.config.reg[i] = reg
end sub

function char_getReg() as object
    return m.config.reg
end function

sub char_setReg(reg as object)
    m.config.reg = reg
end sub

function char_getVeh() as object
    return m.config.veh
end function

sub char_setVeh(veh as object)
    m.config.veh = veh
end sub

function char_getMap() as object
    return m.config.map
end function

sub char_setMap(map as object)
    m.config.map = map
end sub

sub char_save()
    global_save(m.config, "char")
end sub