function game_data() as object

    m.data = {

        ' focus
        getFocus: game_getFocus
        setFocus: game_setFocus


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


function game_getFocus() as string
    return m.config.focus.name
end function

sub game_setFocus(name as string)
    m.config.focus.name = name
end sub