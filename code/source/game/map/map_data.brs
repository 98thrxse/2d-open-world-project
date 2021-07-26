function map_data() as object
    m.map = {

        getEntityOffsetX: map_getEntityOffsetX
        setEntityOffsetX: map_setEntityOffsetX

        getEntityOffsetY: map_getEntityOffsetY
        setEntityOffsetY: map_setEntityOffsetY

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
			
			map: "testOne"
		}

	end if

	return m.map

end function

function map_getEntityOffsetX() as object
    return m.config.offset.x
end function

sub map_setEntityOffsetX(x as object)
    m.config.offset.x = x
end sub

function map_getEntityOffsetY() as object
    return m.config.offset.y
end function

sub map_setEntityOffsetY(y as object)
    m.config.offset.y = y
end sub

function map_getMap() as object
    return m.config.map
end function

sub map_setMap(map as object)
    m.config.map = map
end sub