function char_data() as object

    m.char = {

        ' entity
        getEntityPosX: char_getEntityPosX
        setEntityPosX: char_setEntityPosX
        
        getEntityPosY: char_getEntityPosY
        setEntityPosY: char_setEntityPosY  

        getEntityH: char_getEntityH
        setEntityH: char_setEntityH
        
        getEntityW: char_getEntityW
        setEntityW: char_setEntityW

        getIndex: char_getIndex
        setIndex: char_setIndex

        getAnimTime: char_getAnimTime
        setAnimTime: char_setAnimTime

        getAlpha: char_getAlpha
        setAlpha: char_setAlpha


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
        getNPCCol: char_getNPCCol
        setNPCCol: char_setNPCCol

        getUpCol: char_getUpCol
        setUpCol: char_setUpCol

        getDownCol: char_getDownCol
        setDownCol: char_setDownCol

        getLeftCol: char_getLeftCol
        setLeftCol: char_setLeftCol

        getRightCol: char_getRightCol
        setRightCol: char_setRightCol


        config: invalid
    }

    m.char.config = LoadSavedGame()
    m.char.build = "1.0.1"

    if m.char.config = invalid OR m.char.config.version <> m.char.build
        SaveGame(invalid)

        m.char.config = {
            
            entity: {
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
                    time: 100
                }
            }

            col: {
                npc: invalid,

                up: false,
                down: false
                left: false,
                right: false
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
                    up: 3,
                    down: 3,
                    left: 3,
                    right: 3
                },
            },

            intersect: {
                obj: invalid
            },

            version: m.char.build
        }

        SaveGame(m.config)

    end if

    return m.char

end function


' char data to save

function char_getEntityPosX() as integer
    return m.config.entity.pos.x
end function

sub char_setEntityPosX(x as integer)
    m.config.entity.pos.x = x
    SaveGame(m.config)
end sub


function char_getEntityPosY() as integer
    return m.config.entity.pos.y
end function

sub char_setEntityPosY(y as integer)
    m.config.entity.pos.y = y
    SaveGame(m.config)
end sub


function char_getEntityH() as integer
    return m.config.entity.size.height
end function

sub char_setEntityH(height as integer)
    m.config.entity.size.height = height
    SaveGame(m.config)
end sub


function char_getEntityW() as integer
    return m.config.entity.size.width
end function

sub char_setEntityW(width as integer)
    m.config.entity.size.width = width
    SaveGame(m.config)
end sub


function char_getHP() as integer
    return m.config.attrs.hp
end function

sub char_setHP(hp as integer)
    m.config.attrs.hp = hp
    SaveGame(m.config)
end sub


function char_getSP() as integer
    return m.config.attrs.sp
end function

sub char_setSP(sp as integer)
    m.config.attrs.sp = sp
    SaveGame(m.config)
end sub


function char_getHPDamage() as integer
    return m.config.attrs.damage.hp
end function

sub char_setHPDamage(hp as integer)
    m.config.attrs.damage.hp = hp
    SaveGame(m.config)
end sub


function char_getSPDamage() as integer
    return m.config.attrs.damage.sp
end function

sub char_setSPDamage(sp as integer)
    m.config.attrs.damage.sp = sp
    SaveGame(m.config)
end sub


function char_getHPDamageTime() as integer
    return m.config.attrs.damage.hp_time
end function

sub char_setHPDamageTime(time as integer)
    m.config.attrs.damage.hp_time = time
    SaveGame(m.config)
end sub

function char_getSPDamageTime() as integer
    return m.config.attrs.damage.sp_time
end function

sub char_setSPDamageTime(time as integer)
    m.config.attrs.damage.sp_time = time
    SaveGame(m.config)
end sub



function char_getHPRegen() as integer
    return m.config.attrs.regen.hp
end function

sub char_setHPRegen(hp as integer)
    m.config.attrs.regen.hp = hp
    SaveGame(m.config)
end sub


function char_getSPRegen() as integer
    return m.config.attrs.regen.sp
end function

sub char_setSPRegen(sp as integer)
    m.config.attrs.regen.sp = sp
    SaveGame(m.config)
end sub


function char_getHPRegenTime() as integer
    return m.config.attrs.regen.hp_time
end function

sub char_setHPRegenTime(time as integer)
    m.config.attrs.regen.hp_time = time
    SaveGame(m.config)
end sub

function char_getSPRegenTime() as integer
    return m.config.attrs.regen.sp_time
end function

sub char_setSPRegenTime(time as integer)
    m.config.attrs.regen.sp_time = time
    SaveGame(m.config)
end sub



function char_getIndex() as integer
    return m.config.entity.anim.index
end function

sub char_setIndex(index as integer)
    m.config.entity.anim.index = index
    SaveGame(m.config)
end sub


function char_getAnimTime() as integer
    return m.config.entity.anim.time
end function

sub char_setAnimTime(time as integer)
    m.config.entity.anim.time = time
    SaveGame(m.config)
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
    SaveGame(m.config)
end sub


function char_getUpCol() as boolean
    return m.config.col.up
end function

sub char_setUpCol(col as boolean) 
    m.config.col.up = col
    SaveGame(m.config)
end sub


function char_getDownCol() as boolean
    return m.config.col.down
end function

sub char_setDownCol(col as boolean) 
    m.config.col.down = col
    SaveGame(m.config)
end sub


function char_getLeftCol() as boolean
    return m.config.col.left
end function

sub char_setLeftCol(col as boolean) 
    m.config.col.left = col
    SaveGame(m.config)
end sub


function char_getRightCol() as boolean
    return m.config.col.right
end function

sub char_setRightCol(col as boolean) 
    m.config.col.right = col
    SaveGame(m.config)
end sub



function char_getUpSpeed() as integer
    return m.config.attrs.speed.up
end function

sub char_setUpSpeed(speed as integer) 
    m.config.attrs.speed.up = speed
    SaveGame(m.config)
end sub


function char_getDownSpeed() as integer
    return m.config.attrs.speed.down
end function

sub char_setDownSpeed(speed as integer) 
    m.config.attrs.speed.down = speed
    SaveGame(m.config)
end sub


function char_getLeftSpeed() as integer
    return m.config.attrs.speed.left
end function

sub char_setLeftSpeed(speed as integer) 
    m.config.attrs.speed.left = speed
    SaveGame(m.config)
end sub


function char_getRightSpeed() as integer
    return m.config.attrs.speed.right
end function

sub char_setRightSpeed(speed as integer) 
    m.config.attrs.speed.right = speed
    SaveGame(m.config)
end sub



' save & load functions - fix stas

Function LoadSavedGame() as Dynamic
json = GetRegistryString("SavedGame")
if json <> ""
    obj = ParseJSON(json)
    if obj <> invalid and obj.savedGame <> invalid
        return obj.savedGame
    end if
end if
return invalid
End Function

Sub SaveGame(game as Object)
SaveRegistryString("SavedGame", FormatJSON({savedGame: game}, 1))
End Sub



' registry functions

Sub SaveRegistryString(key As String, value As String)
sec = CreateObject("roRegistrySection", "PoP")
sec.Write(key, value)
sec.Flush()
End Sub

Function GetRegistryString(key as String, default = "") As String
sec = CreateObject("roRegistrySection", "PoP")
if sec.Exists(key)
    return sec.Read(key)
end if
return default
End Function