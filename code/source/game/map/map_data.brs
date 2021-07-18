function map_data(ver) as object
    m.map = {

        getEntityOffsetX: map_getEntityOffsetX
        setEntityOffsetX: map_setEntityOffsetX

        getEntityOffsetY: map_getEntityOffsetY
        setEntityOffsetY: map_setEntityOffsetY

		config: invalid
	}

	m.map.config = globalLoad("map")

	if m.map.config = invalid OR m.map.config.version <> ver
        globalSave(invalid, "map")

		m.map.config = {
			offset: {
				x: 0,
				y: 0
			}

			version: ver
		}

        globalSave(m.config, "map")

	end if

	return m.map

end function

function map_getEntityOffsetX() as integer
    return m.config.offset.x
end function

sub map_setEntityOffsetX(x as integer)
    m.config.offset.x = x
    globalSave(m.config, "map")
end sub

function map_getEntityOffsetY() as integer
    return m.config.offset.y
end function

sub map_setEntityOffsetY(y as integer)
    m.config.offset.y = y
    globalSave(m.config, "map")
end sub