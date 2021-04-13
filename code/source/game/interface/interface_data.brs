function interface_data() as object

    m.interface = {

        ' item
        getMenuItemName: interface_getMenuItemName
        setMenuItemName: interface_setMenuItemName

        config: invalid

    }

    if m.interface.config = invalid

        m.interface.config = {
            focus: {
                menu: [
                    {
                        id: 0,
                        name: "0",
                    },
                    {
                        id: 1,
                        name: "1",
                    },
                    {
                        id: 2,
                        name: "2",
                    }
                ]
            }
        }

    end if

    return m.interface

end function


function interface_getMenuItemName(i as integer) as string
    return m.config.focus.menu[i].name
end function

sub interface_setMenuItemName(i as integer, name as string)
    m.config.focus.menu[i].name = name
end sub