function char_data(ver) as object

    m.char = {

        getEntityName: char_getEntityName
        setEntityName: char_setEntityName

        getEntityPosX: char_getEntityPosX
        setEntityPosX: char_setEntityPosX
        
        getEntityPosY: char_getEntityPosY
        setEntityPosY: char_setEntityPosY  

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


        getObjIntersect: char_getObjIntersect
        setObjIntersect: char_setObjIntersect


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

        save: char_save


        config: invalid
    }

    m.char.config = global_load("char")

    if m.char.config = invalid OR m.char.config.version <> ver
        global_save(invalid, "char")

        m.char.config = {
            name: "char_entity"
            name_up: "char_col_up",
            name_down: "char_col_down",
            name_left: "char_col_left",
            name_right: "char_col_right",
            size: {
                width: 48,
                height: 56
            },
            index: 1,
            alpha: 255,
            reg: ["stand_back1", "stand_front1", "stand_side1", "walk_back1", "walk_back2", "walk_front1", "walk_front2", "walk_side1", "walk_side2", "hp_zero", "sp_zero", "stand_back2", "stand_front2", "stand_side2", "attack_fist1_back", "attack_fist2_back", "attack_leg1_back", "attack_fist1_front", "attack_fist2_front", "attack_leg1_front", "attack_fist1_side", "attack_fist2_side", "attack_fist3_side", "attack_fist4_side", "attack_fist5_side", "attack_fist6_side", "attack_leg1_side", "attack_leg2_side", "attack_leg3_side"]
            scale: {
                x: 1.0
                y: 1.0
            },
            offset: {
                x: 616,
                y: 332
            },
            time: 100
            pos: {
                x: 9562,
                y: 2194
            },
            up: false,
            down: false
            left: false,
            right: false
            npc: invalid,
            marker: invalid
            hp: 100,
            sp: 100
            damage: {
                hp: 10,
                sp: 10,
                hp_time: 500,
                sp_time: 500
            },
            regen: {
                hp: 5,
                sp: 5,
                hp_time: 1000,
                sp_time: 1000
            },
            speed: {
                up: 2,
                down: 2,
                left: 2,
                right: 2
            }
            intersect: {
                obj: invalid
            }
            version: ver
        }

        global_save(m.config, "char")

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


function char_getEntityPosX() as object
    return m.config.pos.x
end function

sub char_setEntityPosX(x as object)
    m.config.pos.x = x
end sub


function char_getEntityPosY() as object
    return m.config.pos.y
end function

sub char_setEntityPosY(y as object)
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



function char_getObjIntersect() as object
    return m.config.intersect.obj
end function

sub char_setObjIntersect(i as object) 
    m.config.intersect.obj = i
end sub



function char_getNPCCol() as object
    return m.config.npc
end function

sub char_setNPCCol(i as object) 
    m.config.npc = i
end sub

function char_getMarkerCol() as object
    return m.config.marker
end function

sub char_setMarkerCol(i as object) 
    m.config.marker = i
end sub


function char_getColUp() as object
    return m.config.up
end function

sub char_setColUp(col as object) 
    m.config.up = col
end sub


function char_getColDown() as object
    return m.config.down
end function

sub char_setColDown(col as object) 
    m.config.down = col
end sub


function char_getColLeft() as object
    return m.config.left
end function

sub char_setColLeft(col as object) 
    m.config.left = col
end sub


function char_getColRight() as object
    return m.config.right
end function

sub char_setColRight(col as object) 
    m.config.right = col
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

function char_getMap() as object
    return m.config.map
end function

sub char_setMap(map as object)
    m.config.map = map
end sub

sub char_save()
    global_save(m.config, "char")
end sub