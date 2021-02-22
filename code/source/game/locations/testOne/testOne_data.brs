function testOne_data() as object

    m.map = {

        ' col
        getCharNPCCol: map_getCharNPCCol
        setCharNPCCol: map_setCharNPCCol


        config: invalid

    }

    if m.map.config = invalid

        m.map.config = {

            col: {
                npc: invalid,
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
