function obj_data() as object

    m.obj = {

        ' pos
        getPosX: obj_getPosX
        setPosX: obj_setPosX
        
        getPosY: obj_getPosY
        setPosY: obj_setPosY


        config: invalid

    }

    if m.obj.config = invalid

        m.obj.config = [
            {
                id: 0,
                obj_name: "obj_obj",
                col_name: "obj_col",
                x: 700,
                y: 100,
                width: 128,
                height: 72
            },
    
            {
                id: 1
                obj_name: "obj_obj",
                col_name: "obj_col",
                x: 90,
                y: 600,
                width: 128,
                height: 72
            }
        ]

    end if

    return m.obj

end function



function obj_getPosX(id as integer) as integer
    return m.config[id].x
end function

sub obj_setPosX(id as integer, x as integer)
    m.config[id].x = x
end sub


function obj_getPosY(id as integer) as integer
    return m.config[id].y
end function

sub obj_setPosY(id as integer, y as integer)
    m.config[id].y = y
end sub



function obj_getAnim(id as integer) as integer
    return m.config[id].index
end function

sub obj_setAnim(id as integer, index as integer)
    m.config[id].index = index
end sub