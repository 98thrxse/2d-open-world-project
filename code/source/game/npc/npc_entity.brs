function npc_entity(object)

  object.onCreate = function(args)


  end function


  object.entityXY = function()
    ' position
    m.x = m.game.char.getZeroOffsetX()
    m.y = m.game.char.getZeroOffsetY()
  end function


  object.entityGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1

      npc_regions = []

      if m.getImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()) = invalid
        for j = 0 to m.game.npc.config[i].entity.anim.reg.Count() - 1
          ' loadBitmap
          m.game.loadBitmap(m.game.npc.getReg(i, j).toStr(), "pkg:/media/npc/sprites/" + m.game.npc.getReg(i, j).toStr() + ".png")

          ' getBitmap
          npc_bitmap = m.game.getBitmap(m.game.npc.getReg(i, j).toStr())
      
          ' roRegion
          npc_region = CreateObject("roRegion", npc_bitmap, 0, 0, npc_bitmap.GetWidth(), npc_bitmap.GetHeight())

          npc_regions.push(npc_region)

        end for

        ' addAnimatedImage
        m.addAnimatedImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr(), npc_regions, { index: m.game.npc.getIndex(i)
          offset_x: m.game.npc.getEntityOffsetX(i),
          offset_y: m.game.npc.getEntityOffsetY(i)
        })

      end if
      
    end for

  end function
  

  object.onUpdate = function(dt as float)

    m.entityXY()
    m.entityGen()

  end function
      
end function