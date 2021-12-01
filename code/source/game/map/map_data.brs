function map_data() as object
    m.map = {

        getOffsetX: map_getOffsetX
        setOffsetX: map_setOffsetX

        getOffsetY: map_getOffsetY
        setOffsetY: map_setOffsetY

		getMap: map_getMap
        setMap: map_setMap

		config: invalid
	}

	if m.map.config = invalid

		m.map.config = {
			offset: {
				x: 0,
				y: 0
			},
			
			name: "testOne"
		}

	end if

	return m.map

end function

function map_getOffsetX() as object
    return m.config.offset.x
end function

sub map_setOffsetX(x as object)
    m.config.offset.x = x
end sub

function map_getOffsetY() as object
    return m.config.offset.y
end function

sub map_setOffsetY(y as object)
    m.config.offset.y = y
end sub

function map_getMap() as object
    return m.config.name
end function

sub map_setMap(name as object)
    m.config.name = name
end sub