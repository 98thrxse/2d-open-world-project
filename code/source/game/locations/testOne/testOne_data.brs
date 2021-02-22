function testOne_data() as object

    m.map = {

        ' intersect
        getCharObjIntersect: map_getCharObjIntersect
        setCharObjIntersect: map_setCharObjIntersect

        ' col
        getCharNPCCol: map_getCharNPCCol
        setCharNPCCol: map_setCharNPCCol


        config: invalid

    }

    if m.map.config = invalid

        m.map.config = {

            intersect: {
                obj: invalid
            }

            col: {
                npc: invalid
            }

        }

    end if

    return m.map

end function

function map_getCharNPCCol() as object
    return m.config.col.npc
end function

sub map_setCharNPCCol(id as object) 
    m.config.col.npc = id
end sub



function map_getCharObjIntersect() as object
    return m.config.intersect.obj
end function

sub map_setCharObjIntersect(id as object) 
    m.config.intersect.obj = id
end sub
