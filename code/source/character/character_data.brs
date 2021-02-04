function character_data() as object

    m.data = {

        ' attributes
        getHP: character_getHP
        setHP: character_setHP

        getSP: character_getSP
        setSP: character_setSP


        ' collider
        getUpCollider: character_getUpCollider
        setUpCollider: character_setUpCollider

        getDownCollider: character_getDownCollider
        setDownCollider: character_setDownCollider

        getLeftCollider: character_getLeftCollider
        setLeftCollider: character_setLeftCollider

        getRightCollider: character_getRightCollider
        setRightCollider: character_setRightCollider


        ' speed
        getUpSpeed: character_getUpSpeed
        setUpSpeed: character_setUpSpeed

        getDownSpeed: character_getDownSpeed
        setDownSpeed: character_setDownSpeed

        getLeftSpeed: character_getLeftSpeed
        setLeftSpeed: character_setLeftSpeed

        getRightSpeed: character_getRightSpeed
        setRightSpeed: character_setRightSpeed

        params: invalid
    }

    if m.data.params = invalid
        m.data.params = {

            attributes: {
                hp: 100,
                sp: 100
            },
        
            collider: {
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
            }
        }

    end if

    ' return m.data.params
    return m.data

end function

function character_getHP() as integer
    return m.data.params.attributes.hp
end function

sub character_setHP(hp as integer) 
    m.data.params.attributes.hp = hp
end sub


function character_getSP() as integer
    return m.data.params.attributes.sp
end function

sub character_setSP(sp as integer)
    m.data.params.attributes.sp = sp
end sub


function character_getUpCollider() as boolean
    return m.data.params.collider.up
end function

sub character_setUpCollider(collider as boolean) 
    m.data.params.collider.up = collider
end sub


function character_getDownCollider() as boolean
    return m.data.params.collider.down
end function

sub character_setDownCollider(collider as boolean) 
    m.data.params.collider.down = collider
end sub


function character_getLeftCollider() as boolean
    return m.data.params.collider.left
end function

sub character_setLeftCollider(collider as boolean) 
    m.data.params.collider.left = collider
end sub


function character_getRightCollider() as boolean
    return m.data.params.collider.right
end function

sub character_setRightCollider(collider as boolean) 
    m.data.params.collider.right = collider
end sub



function character_getUpSpeed() as object
    return m.data.params.speed.up
end function

sub character_setUpSpeed(speed as object) 
    m.data.params.speed.up = speed
end sub


function character_getDownSpeed() as object
    return m.data.params.speed.down
end function

sub character_setDownSpeed(speed as object) 
    m.data.params.speed.down = speed
end sub


function character_getLeftSpeed() as object
    return m.data.params.speed.left
end function

sub character_setLeftSpeed(speed as object) 
    m.data.params.speed.left = speed
end sub


function character_getRightSpeed() as object
    return m.data.params.speed.right
end function

sub character_setRightSpeed(speed as object) 
    m.data.params.speed.right = speed
end sub



