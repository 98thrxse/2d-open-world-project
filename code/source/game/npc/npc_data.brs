function npc_data() as object

    m.npc = {

        ' attributes
        npcGetHP: npc_getHP
        npcSetHP: npc_setHP


        ' anim
        npcGetAnim: npc_getAnim
        npcSetAnim: npc_setAnim


        config: invalid

    }

    if m.npc.config = invalid

        m.npc.config = [
            {
                id: 0,
                index: 0,
                obj_name: "npc_obj",
                col_name: "npc_col",
                offset_x: 200,
                offset_y: 100,
                width: 48,
                height: 56,
                hp: 100
            },

            {
                id: 1
                index: 0,
                obj_name: "npc_obj",
                col_name: "npc_col",
                offset_x: 400,
                offset_y: 300
                width: 48,
                height: 56,
                hp: 100
            }  
        ]

    end if

    return m.npc

end function


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