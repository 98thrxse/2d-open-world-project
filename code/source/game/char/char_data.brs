function char_data() as object

    this = {

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


        ' col
        getNPCCollider: char_getNPCCollider
        setNPCCollider: char_setNPCCollider

        getUpCollider: char_getUpCollider
        setUpCollider: char_setUpCollider

        getDownCollider: char_getDownCollider
        setDownCollider: char_setDownCollider

        getLeftCollider: char_getLeftCollider
        setLeftCollider: char_setLeftCollider

        getRightCollider: char_getRightCollider
        setRightCollider: char_setRightCollider


        ' speed
        getUpSpeed: char_getUpSpeed
        setUpSpeed: char_setUpSpeed

        getDownSpeed: char_getDownSpeed
        setDownSpeed: char_setDownSpeed

        getLeftSpeed: char_getLeftSpeed
        setLeftSpeed: char_setLeftSpeed

        getRightSpeed: char_getRightSpeed
        setRightSpeed: char_setRightSpeed

        _params: invalid
    }

    this._params = LoadSavedGame()
    this._build = "1.0.0"

    if this._params = invalid OR this._params.version <> this._build
        SaveGame(invalid)

        this._params = {

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
        
            collider: {
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

            version: this._build
        }

        SaveGame(m._params)

    end if

    return this

end function


' char data to save

function char_getEntityPosX() as integer
    return m._params.pos.x
end function

sub char_setEntityPosX(x as integer)
    m._params.pos.x = x
    SaveGame(m._params)
end sub


function char_getEntityPosY() as integer
    return m._params.pos.y
end function

sub char_setEntityPosY(y as integer)
    m._params.pos.y = y
    SaveGame(m._params)
end sub


function char_getEntityH() as integer
    return m._params.size.height
end function

sub char_setEntityH(height as integer)
    m._params.size.height = height
    SaveGame(m._params)
end sub


function char_getEntityW() as integer
    return m._params.size.width
end function

sub char_setEntityW(width as integer)
    m._params.size.width = width
    SaveGame(m._params)
end sub


function char_getHP() as integer
    return m._params.attributes.hp
end function

sub char_setHP(hp as integer)
    m._params.attributes.hp = hp
    SaveGame(m._params)
end sub


function char_getSP() as integer
    return m._params.attributes.sp
end function

sub char_setSP(sp as integer)
    m._params.attributes.sp = sp
    SaveGame(m._params)
end sub


function char_getHPDamage() as integer
    return m._params.damage.hp
end function

sub char_setHPDamage(hp as integer)
    m._params.damage.hp = hp
    SaveGame(m._params)
end sub


function char_getSPDamage() as integer
    return m._params.damage.sp
end function

sub char_setSPDamage(sp as integer)
    m._params.damage.sp = sp
    SaveGame(m._params)
end sub


function char_getHPDamageTime() as integer
    return m._params.damage.hp_time
end function

sub char_setHPDamageTime(hp_time as integer)
    m._params.damage.hp_time = hp_time
    SaveGame(m._params)
end sub

function char_getSPDamageTime() as integer
    return m._params.damage.sp_time
end function

sub char_setSPDamageTime(sp_time as integer)
    m._params.damage.sp_time = sp_time
    SaveGame(m._params)
end sub



function char_getHPRegen() as integer
    return m._params.regen.hp
end function

sub char_setHPRegen(hp as integer)
    m._params.regen.hp = hp
    SaveGame(m._params)
end sub


function char_getSPRegen() as integer
    return m._params.regen.sp
end function

sub char_setSPRegen(sp as integer)
    m._params.regen.sp = sp
    SaveGame(m._params)
end sub


function char_getHPRegenTime() as integer
    return m._params.regen.hp_time
end function

sub char_setHPRegenTime(hp_time as integer)
    m._params.regen.hp_time = hp_time
    SaveGame(m._params)
end sub

function char_getSPRegenTime() as integer
    return m._params.regen.sp_time
end function

sub char_setSPRegenTime(sp_time as integer)
    m._params.regen.sp_time = sp_time
    SaveGame(m._params)
end sub



function char_getAnim() as integer
    return m._params.anim.index
end function

sub char_setAnim(index as integer)
    m._params.anim.index = index
    SaveGame(m._params)
end sub


function char_getAnimTime() as integer
    return m._params.anim.time
end function

sub char_setAnimTime(time as integer)
    m._params.anim.time = time
    SaveGame(m._params)
end sub


function char_getAlpha() as integer
    return m._params.anim.alpha
end function

sub char_setAlpha(alpha as integer)
    m._params.anim.alpha = alpha
end sub



function char_getNPCCollider() as object
    return m._params.collider.npc
end function

sub char_setNPCCollider(id as object) 
    m._params.collider.npc = id
    SaveGame(m._params)
end sub


function char_getUpCollider() as boolean
    return m._params.collider.up
end function

sub char_setUpCollider(collider as boolean) 
    m._params.collider.up = collider
    SaveGame(m._params)
end sub


function char_getDownCollider() as boolean
    return m._params.collider.down
end function

sub char_setDownCollider(collider as boolean) 
    m._params.collider.down = collider
    SaveGame(m._params)
end sub


function char_getLeftCollider() as boolean
    return m._params.collider.left
end function

sub char_setLeftCollider(collider as boolean) 
    m._params.collider.left = collider
    SaveGame(m._params)
end sub


function char_getRightCollider() as boolean
    return m._params.collider.right
end function

sub char_setRightCollider(collider as boolean) 
    m._params.collider.right = collider
    SaveGame(m._params)
end sub



function char_getUpSpeed() as object
    return m._params.speed.up
end function

sub char_setUpSpeed(speed as object) 
    m._params.speed.up = speed
    SaveGame(m._params)
end sub


function char_getDownSpeed() as object
    return m._params.speed.down
end function

sub char_setDownSpeed(speed as object) 
    m._params.speed.down = speed
    SaveGame(m._params)
end sub


function char_getLeftSpeed() as object
    return m._params.speed.left
end function

sub char_setLeftSpeed(speed as object) 
    m._params.speed.left = speed
    SaveGame(m._params)
end sub


function char_getRightSpeed() as object
    return m._params.speed.right
end function

sub char_setRightSpeed(speed as object) 
    m._params.speed.right = speed
    SaveGame(m._params)
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