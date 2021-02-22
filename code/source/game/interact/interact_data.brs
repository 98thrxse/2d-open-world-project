function interact_data() as object

    m.interact = {

        ' intersect
        getCharObjIntersect: interact_getCharObjIntersect
        setCharObjIntersect: interact_setCharObjIntersect

        ' col
        getCharNPCCol: interact_getCharNPCCol
        setCharNPCCol: interact_setCharNPCCol


        config: invalid

    }

    if m.interact.config = invalid

        m.interact.config = {

            intersect: {
                obj: invalid
            }

            col: {
                npc: invalid
            }

        }

    end if

    return m.interact

end function


function interact_getCharNPCCol() as object
    return m.config.col.npc
end function

sub interact_setCharNPCCol(id as object) 
    m.config.col.npc = id
end sub



function interact_getCharObjIntersect() as object
    return m.config.intersect.obj
end function

sub interact_setCharObjIntersect(id as object) 
    m.config.intersect.obj = id
end sub
