function interface_data() as object

    m.interface = {

        ' menu
        getMMToggle: interface_getMMToggle
        setMMToggle: interface_setMMToggle


        config: invalid

    }

    if m.interface.config = invalid

        m.interface.config = {

            mm: {
                toggle: false
            }
        }

    end if

    return m.interface

end function


function interface_getMMToggle() as boolean
    return m.config.mm.toggle
end function

sub interface_setMMToggle(toggle as boolean)
    m.config.mm.toggle = toggle
end sub