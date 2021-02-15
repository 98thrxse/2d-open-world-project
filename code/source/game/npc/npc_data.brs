function npc_data() as object

    m.npc = {

        ' attributes
        getHP: npc_getHP
        setHP: npc_setHP

        ' pos
        getPosX: npc_getPosX
        setPosX: npc_setPosX
        
        getPosY: npc_getPosY
        setPosY: npc_setPosY 

        ' anim
        getAnim: npc_getAnim
        setAnim: npc_setAnim


        config: invalid

    }

    if m.npc.config = invalid

        m.npc.config = [
            {
                id: 0,
                index: 0,
                obj_name: "npc_obj",
                col_name: "npc_col",
                x: 200,
                y: 100,
                width: 48,
                height: 56,
                hp: 100
            },

            {
                id: 1
                index: 0,
                obj_name: "npc_obj",
                col_name: "npc_col",
                x: 400,
                y: 300
                width: 48,
                height: 56,
                hp: 100
            }  
        ]

    end if

    return m.npc

end function



function npc_getPosX(id as integer) as integer
    return m.config[id].x
end function

sub npc_setPosX(id as integer, x as integer)
    m.config[id].x = x
end sub


function npc_getPosY(id as integer) as integer
    return m.config[id].y
end function

sub npc_setPosY(id as integer, y as integer)
    m.config[id].y = y
end sub



function npc_getHP(id as integer) as integer
    return m.config[id].hp
end function


sub npc_setHP(id as integer, hp as integer)
    m.config[id].hp = hp
end sub



function npc_getAnim(id as integer) as integer
    return m.config[id].index
end function

sub npc_setAnim(id as integer, index as integer)
    m.config[id].index = index
end sub