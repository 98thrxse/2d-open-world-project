function border_data() as object

    border = {

        getName: border_getName
        setName: border_setName
        
        getColX: border_getColX
        setColX: border_setColX
        
        getColY: border_getColY
        setColY: border_setColY

        getColH: border_getColH
        setColH: border_setColH
        
        getColW: border_getColW
        setColW: border_setColW

        config: invalid

    }

    if border.config = invalid

        border.config = []

    end if

    return border

end function

function border_getName(i as object) as object
    return m.config[i].name
end function

sub border_setName(i as object, name as object)
    m.config[i].name = name
end sub

function border_getColX(i as object) as object
    return m.config[i].col.x
end function

sub border_setColX(i as object, x as object)
    m.config[i].col.x = x
end sub


function border_getColY(i as object) as object
    return m.config[i].col.y
end function

sub border_setColY(i as object, y as object)
    m.config[i].col.y = y
end sub


function border_getColH(i as object) as object
    return m.config[i].col.height
end function

sub border_setColH(i as object, height as object)
    m.config[i].col.height = height
end sub


function border_getColW(i as object) as object
    return m.config[i].col.width
end function

sub border_setColW(i as object, width as object)
    m.config[i].col.width = width
end sub