function char_data() as object

    m.char = {

        ' pos
        getEntityPosX: char_getEntityPosX
        setEntityPosX: char_setEntityPosX
        
        getEntityPosY: char_getEntityPosY
        setEntityPosY: char_setEntityPosY  


        ' size
        getEntityH: char_getEntityH
        setEntityH: char_setEntityH
        
        getEntityW: char_getEntityW
        setEntityW: char_setEntityW


        ' attributes
        getHP: char_getHP
        setHP: char_setHP

        getSP: char_getSP
        setSP: char_setSP


        ' damage
        getHPDamage: char_getHPDamage
        setHPDamage: char_setHPDamage

        getSPDamage: char_getSPDamage
        setSPDamage: char_setSPDamage

        getHPDamageTime: char_getHPDamageTime
        setHPDamageTime: char_setHPDamageTime

        getSPDamageTime: char_getSPDamageTime
        setSPDamageTime: char_setSPDamageTime


        ' regen
        getHPRegen: char_getHPRegen
        setHPRegen: char_setHPRegen

        getSPRegen: char_getSPRegen
        setSPRegen: char_setSPRegen

        getHPRegenTime: char_getHPRegenTime
        setHPRegenTime: char_setHPRegenTime

        getSPRegenTime: char_getSPRegenTime
        setSPRegenTime: char_setSPRegenTime


        ' anim
        getAnim: char_getAnim
        setAnim: char_setAnim

        getAnimTime: char_getAnimTime
        setAnimTime: char_setAnimTime

        getAlpha: char_getAlpha
        setAlpha: char_setAlpha


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


        ' speed
        getUpSpeed: char_getUpSpeed
        setUpSpeed: char_setUpSpeed

        getDownSpeed: char_getDownSpeed
        setDownSpeed: char_setDownSpeed

        getLeftSpeed: char_getLeftSpeed
        setLeftSpeed: char_setLeftSpeed

        getRightSpeed: char_getRightSpeed
        setRightSpeed: char_setRightSpeed

        config: invalid
    }

    m.char.config = LoadSavedGame()
    m.char.build = "1.0.1"

    if m.char.config = invalid OR m.char.config.version <> m.char.build
        SaveGame(invalid)

        m.char.config = {

            pos: {
                x: 0,
                y: 0
            },

            size: {
                width: 48,
                height: 56,
            },

            attributes: {
                hp: 100,
                sp: 100
            },

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

            anim: {
                index: 0,
                alpha: 255,
		        time: 100
            },

            intersect: {
                obj: invalid
            },
        
            col: {
                npc: invalid,

                up: false,
                down: false
                left: false,
                right: false
            },
        
            speed: {
                up: 3,
                down: 3,
                left: 3,
                right: 3
            },

            version: m.char.build
        }

        SaveGame(m.config)

    end if

    return m.char

end function


' char data to save

function char_getEntityPosX() as integer
    return m.config.pos.x
end function

sub char_setEntityPosX(x as integer)
    m.config.pos.x = x
    SaveGame(m.config)
end sub


function char_getEntityPosY() as integer
    return m.config.pos.y
end function

sub char_setEntityPosY(y as integer)
    m.config.pos.y = y
    SaveGame(m.config)
end sub


function char_getEntityH() as integer
    return m.config.size.height
end function

sub char_setEntityH(height as integer)
    m.config.size.height = height
    SaveGame(m.config)
end sub


function char_getEntityW() as integer
    return m.config.size.width
end function

sub char_setEntityW(width as integer)
    m.config.size.width = width
    SaveGame(m.config)
end sub


function char_getHP() as integer
    return m.config.attributes.hp
end function

sub char_setHP(hp as integer)
    m.config.attributes.hp = hp
    SaveGame(m.config)
end sub


function char_getSP() as integer
    return m.config.attributes.sp
end function

sub char_setSP(sp as integer)
    m.config.attributes.sp = sp
    SaveGame(m.config)
end sub


function char_getHPDamage() as integer
    return m.config.damage.hp
end function

sub char_setHPDamage(hp as integer)
    m.config.damage.hp = hp
    SaveGame(m.config)
end sub


function char_getSPDamage() as integer
    return m.config.damage.sp
end function

sub char_setSPDamage(sp as integer)
    m.config.damage.sp = sp
    SaveGame(m.config)
end sub


function char_getHPDamageTime() as integer
    return m.config.damage.hp_time
end function

sub char_setHPDamageTime(hp_time as integer)
    m.config.damage.hp_time = hp_time
    SaveGame(m.config)
end sub

function char_getSPDamageTime() as integer
    return m.config.damage.sp_time
end function

sub char_setSPDamageTime(sp_time as integer)
    m.config.damage.sp_time = sp_time
    SaveGame(m.config)
end sub



function char_getHPRegen() as integer
    return m.config.regen.hp
end function

sub char_setHPRegen(hp as integer)
    m.config.regen.hp = hp
    SaveGame(m.config)
end sub


function char_getSPRegen() as integer
    return m.config.regen.sp
end function

sub char_setSPRegen(sp as integer)
    m.config.regen.sp = sp
    SaveGame(m.config)
end sub


function char_getHPRegenTime() as integer
    return m.config.regen.hp_time
end function

sub char_setHPRegenTime(hp_time as integer)
    m.config.regen.hp_time = hp_time
    SaveGame(m.config)
end sub

function char_getSPRegenTime() as integer
    return m.config.regen.sp_time
end function

sub char_setSPRegenTime(sp_time as integer)
    m.config.regen.sp_time = sp_time
    SaveGame(m.config)
end sub



function char_getAnim() as integer
    return m.config.anim.index
end function

sub char_setAnim(index as integer)
    m.config.anim.index = index
    SaveGame(m.config)
end sub


function char_getAnimTime() as integer
    return m.config.anim.time
end function

sub char_setAnimTime(time as integer)
    m.config.anim.time = time
    SaveGame(m.config)
end sub


function char_getAlpha() as integer
    return m.config.anim.alpha
end function

sub char_setAlpha(alpha as integer)
    m.config.anim.alpha = alpha
end sub



function char_getObjIntersect() as object
    return m.config.intersect.obj
end function

sub char_setObjIntersect(id as object) 
    m.config.intersect.obj = id
end sub



function char_getNPCCol() as object
    return m.config.col.npc
end function

sub char_setNPCCol(id as object) 
    m.config.col.npc = id
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



function char_getUpSpeed() as object
    return m.config.speed.up
end function

sub char_setUpSpeed(speed as object) 
    m.config.speed.up = speed
    SaveGame(m.config)
end sub


function char_getDownSpeed() as object
    return m.config.speed.down
end function

sub char_setDownSpeed(speed as object) 
    m.config.speed.down = speed
    SaveGame(m.config)
end sub


function char_getLeftSpeed() as object
    return m.config.speed.left
end function

sub char_setLeftSpeed(speed as object) 
    m.config.speed.left = speed
    SaveGame(m.config)
end sub


function char_getRightSpeed() as object
    return m.config.speed.right
end function

sub char_setRightSpeed(speed as object) 
    m.config.speed.right = speed
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