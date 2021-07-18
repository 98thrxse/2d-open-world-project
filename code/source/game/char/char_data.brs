function char_data(ver) as object

    m.char = {

        ' entity
        getEntityName: char_getEntityName
        setEntityName: char_setEntityName

        getEntityPosX: char_getEntityPosX
        setEntityPosX: char_setEntityPosX
        
        getEntityPosY: char_getEntityPosY
        setEntityPosY: char_setEntityPosY  

        getEntityH: char_getEntityH
        setEntityH: char_setEntityH
        
        getEntityW: char_getEntityW
        setEntityW: char_setEntityW

        getScaleX: char_getScaleX
        setScaleX: char_setScaleX

        getScaleY: char_getScaleY
        setScaleY: char_setScaleY

        getEntityOffsetX: char_getEntityOffsetX
        setEntityOffsetX: char_setEntityOffsetX

        getEntityOffsetY: char_getEntityOffsetY
        setEntityOffsetY: char_setEntityOffsetY

        getIndex: char_getIndex
        setIndex: char_setIndex

        getAnimTime: char_getAnimTime
        setAnimTime: char_setAnimTime

        getAlpha: char_getAlpha
        setAlpha: char_setAlpha

        getReg: char_getReg
        setReg: char_setReg

        ' attrs
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


        ' intersect
        getObjIntersect: char_getObjIntersect
        setObjIntersect: char_setObjIntersect


        ' col
        getColUpName: char_getColUpName
        setColUpName: char_setColUpName

        getColDownName: char_getColDownName
        setColDownName: char_setColDownName

        getColLeftName: char_getColLeftName
        setColLeftName: char_setColLeftName

        getColRightName: char_getColRightName
        setColRightName: char_setColRightName

        getColOffsetX: char_getColOffsetX
        setColOffsetX: char_setColOffsetX

        getColOffsetY: char_getColOffsetY
        setColOffsetY: char_setColOffsetY

        getNPCCol: char_getNPCCol
        setNPCCol: char_setNPCCol

        getColUp: char_getColUp
        setColUp: char_setColUp

        getColDown: char_getColDown
        setColDown: char_setColDown

        getColLeft: char_getColLeft
        setColLeft: char_setColLeft

        getColRight: char_getColRight
        setColRight: char_setColRight

        getColH: char_getColH
        setColH: char_setColH
        
        getColW: char_getColW
        setColW: char_setColW


        config: invalid
    }

    m.char.config = global_load("char")

    if m.char.config = invalid OR m.char.config.version <> ver
        global_save(invalid, "char")

        m.char.config = {
            
            entity: {
                name: "char_entity"
                pos: {
                    x: 0,
                    y: 0
                },
    
                size: {
                    width: 48,
                    height: 56,
                },

                anim: {
                    index: 0,
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
                },


            }

            col: {
                name_up: "char_col_up",
                name_down: "char_col_down",
                name_left: "char_col_left",
                name_right: "char_col_right",

                offset: {
                    x: 616,
                    y: 332
                },
                size: {
                    width: 48,
                    height: 56,
                },

                up: false,
                down: false
                left: false,
                right: false

                npc: invalid
            },

            attrs: {
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
                    up: 5,
                    down: 5,
                    left: 5,
                    right: 5
                },
            },

            intersect: {
                obj: invalid
            },

            version: ver
        }

        global_save(m.config, "char")

    end if

    return m.char

end function


function char_getColUpName() as object
    return m.config.col.name_up
end function

sub char_setColUpName(name as string)
    m.config.col.name_up = name
end sub


function char_getColDownName() as object
    return m.config.col.name_down
end function


sub char_setColDownName(name as string)
    m.config.col.name_down = name
end sub


function char_getColLeftName() as object
    return m.config.col.name_left
end function

sub char_setColLeftName(name as string)
    m.config.col.name_left = name
end sub


function char_getColRightName() as object
    return m.config.col.name_right
end function

sub char_setColRightName(name as string)
    m.config.col.name_right = name
end sub


function char_getScaleX() as integer
    return m.config.entity.anim.scale.x
end function

sub char_setScaleX(x as integer)
    m.config.entity.anim.scale.x = x
    global_save(m.config, "char")
end sub

function char_getScaleY() as integer
    return m.config.entity.anim.scale.y
end function

sub char_setScaleY(y as integer)
    m.config.entity.anim.scale.y = y
    global_save(m.config, "char")
end sub


function char_getEntityOffsetX() as integer
    return m.config.entity.anim.offset.x
end function

sub char_setEntityOffsetX(x as integer)
    m.config.entity.anim.offset.x = x
    global_save(m.config, "char")
end sub

function char_getEntityOffsetY() as integer
    return m.config.entity.anim.offset.y
end function

sub char_setEntityOffsetY(y as integer)
    m.config.entity.anim.offset.y = y
    global_save(m.config, "char")
end sub


function char_getColOffsetX() as integer
    return m.config.col.offset.x
end function

sub char_setColOffsetX(x as integer)
    m.config.col.offset.x = x
    global_save(m.config, "char")
end sub

function char_getColOffsetY() as integer
    return m.config.col.offset.y
end function

sub char_setColOffsetY(y as integer)
    m.config.col.offset.y = y
    global_save(m.config, "char")
end sub


function char_getEntityName() as object
    return m.config.entity.name
end function

sub char_setEntityName(name as string)
    m.config.entity.name = name
end sub


function char_getEntityPosX() as integer
    return m.config.entity.pos.x
end function

sub char_setEntityPosX(x as integer)
    m.config.entity.pos.x = x
    global_save(m.config, "char")
end sub


function char_getEntityPosY() as integer
    return m.config.entity.pos.y
end function

sub char_setEntityPosY(y as integer)
    m.config.entity.pos.y = y
    global_save(m.config, "char")
end sub


function char_getEntityH() as integer
    return m.config.entity.size.height
end function

sub char_setEntityH(height as integer)
    m.config.entity.size.height = height
    global_save(m.config, "char")
end sub


function char_getEntityW() as integer
    return m.config.entity.size.width
end function

sub char_setEntityW(width as integer)
    m.config.entity.size.width = width
    global_save(m.config, "char")
end sub


function char_getColH() as integer
    return m.config.col.size.height
end function

sub char_setColH(height as integer)
    m.config.col.size.height = height
    global_save(m.config, "char")
end sub


function char_getColW() as integer
    return m.config.col.size.width
end function

sub char_setColW(width as integer)
    m.config.col.size.width = width
    global_save(m.config, "char")
end sub


function char_getHP() as integer
    return m.config.attrs.hp
end function

sub char_setHP(hp as integer)
    m.config.attrs.hp = hp
    global_save(m.config, "char")
end sub


function char_getSP() as integer
    return m.config.attrs.sp
end function

sub char_setSP(sp as integer)
    m.config.attrs.sp = sp
    global_save(m.config, "char")
end sub


function char_getHPDamage() as integer
    return m.config.attrs.damage.hp
end function

sub char_setHPDamage(hp as integer)
    m.config.attrs.damage.hp = hp
    global_save(m.config, "char")
end sub


function char_getSPDamage() as integer
    return m.config.attrs.damage.sp
end function

sub char_setSPDamage(sp as integer)
    m.config.attrs.damage.sp = sp
    global_save(m.config, "char")
end sub


function char_getHPDamageTime() as integer
    return m.config.attrs.damage.hp_time
end function

sub char_setHPDamageTime(time as integer)
    m.config.attrs.damage.hp_time = time
    global_save(m.config, "char")
end sub

function char_getSPDamageTime() as integer
    return m.config.attrs.damage.sp_time
end function

sub char_setSPDamageTime(time as integer)
    m.config.attrs.damage.sp_time = time
    global_save(m.config, "char")
end sub



function char_getHPRegen() as integer
    return m.config.attrs.regen.hp
end function

sub char_setHPRegen(hp as integer)
    m.config.attrs.regen.hp = hp
    global_save(m.config, "char")
end sub


function char_getSPRegen() as integer
    return m.config.attrs.regen.sp
end function

sub char_setSPRegen(sp as integer)
    m.config.attrs.regen.sp = sp
    global_save(m.config, "char")
end sub


function char_getHPRegenTime() as integer
    return m.config.attrs.regen.hp_time
end function

sub char_setHPRegenTime(time as integer)
    m.config.attrs.regen.hp_time = time
    global_save(m.config, "char")
end sub

function char_getSPRegenTime() as integer
    return m.config.attrs.regen.sp_time
end function

sub char_setSPRegenTime(time as integer)
    m.config.attrs.regen.sp_time = time
    global_save(m.config, "char")
end sub



function char_getIndex() as integer
    return m.config.entity.anim.index
end function

sub char_setIndex(index as integer)
    m.config.entity.anim.index = index
    global_save(m.config, "char")
end sub


function char_getAnimTime() as integer
    return m.config.entity.anim.time
end function

sub char_setAnimTime(time as integer)
    m.config.entity.anim.time = time
    global_save(m.config, "char")
end sub


function char_getAlpha() as integer
    return m.config.entity.anim.alpha
end function

sub char_setAlpha(alpha as integer)
    m.config.entity.anim.alpha = alpha
end sub



function char_getObjIntersect() as object
    return m.config.intersect.obj
end function

sub char_setObjIntersect(i as object) 
    m.config.intersect.obj = i
end sub



function char_getNPCCol() as object
    return m.config.col.npc
end function

sub char_setNPCCol(i as object) 
    m.config.col.npc = i
    global_save(m.config, "char")
end sub


function char_getColUp() as boolean
    return m.config.col.up
end function

sub char_setColUp(col as boolean) 
    m.config.col.up = col
    global_save(m.config, "char")
end sub


function char_getColDown() as boolean
    return m.config.col.down
end function

sub char_setColDown(col as boolean) 
    m.config.col.down = col
    global_save(m.config, "char")
end sub


function char_getColLeft() as boolean
    return m.config.col.left
end function

sub char_setColLeft(col as boolean) 
    m.config.col.left = col
    global_save(m.config, "char")
end sub


function char_getColRight() as boolean
    return m.config.col.right
end function

sub char_setColRight(col as boolean) 
    m.config.col.right = col
    global_save(m.config, "char")
end sub



function char_getUpSpeed() as integer
    return m.config.attrs.speed.up
end function

sub char_setUpSpeed(speed as integer) 
    m.config.attrs.speed.up = speed
    global_save(m.config, "char")
end sub


function char_getDownSpeed() as integer
    return m.config.attrs.speed.down
end function

sub char_setDownSpeed(speed as integer) 
    m.config.attrs.speed.down = speed
    global_save(m.config, "char")
end sub


function char_getLeftSpeed() as integer
    return m.config.attrs.speed.left
end function

sub char_setLeftSpeed(speed as integer) 
    m.config.attrs.speed.left = speed
    global_save(m.config, "char")
end sub


function char_getRightSpeed() as integer
    return m.config.attrs.speed.right
end function

sub char_setRightSpeed(speed as integer) 
    m.config.attrs.speed.right = speed
    global_save(m.config, "char")
end sub

function char_getReg(i as integer) as object
    return m.config.entity.anim.reg[i]
end function

sub char_setReg(i as integer, reg as object)
    m.config.entity.anim.reg[i] = reg
end sub