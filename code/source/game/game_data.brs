function game_data() as object

    m.data = {

        ' focus
        getFocusGroup: game_getFocusGroup
        setFocusGroup: game_setFocusGroup


        config: invalid

    }

    if m.data.config = invalid

        m.data.config = {
            focus: {
                name: "char"
            }
        }

    end if

    return m.data

end function


function game_getFocusGroup() as string
    return m.config.focus.name
end function

sub game_setFocusGroup(name as string)
    m.config.focus.name = name
end sub