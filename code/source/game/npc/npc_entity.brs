function npc_entity(object)

  object.onCreate = function(args)

    m.entityXY()

  end function


  object.entityXY = function()
    ' position
    m.x = m.game.screen.GetWidth() / 2 - m.game.char.getEntityPosX()
    m.y = m.game.screen.GetHeight() / 2 - m.game.char.getEntityPosY()
  end function


  object.entityGen = function()

    ' loading map config to create npc
    for i = 0 to m.game.npc.config.Count() - 1

      npc_regions = []

      if m.getImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr()) = invalid
        for j = 0 to m.game.npc.config[i].entity.anim.reg.Count() - 1
          ' loadBitmap
          m.game.loadBitmap(m.game.npc.config[i].entity.anim.reg[j].toStr(), "pkg:/media/npc/sprites/" + m.game.npc.config[i].entity.anim.reg[j].toStr() + ".png")

          ' getBitmap
          npc_bitmap = m.game.getBitmap(m.game.npc.config[i].entity.anim.reg[j].toStr())
      
          ' roRegion
          npc_region = CreateObject("roRegion", npc_bitmap, 0, 0, npc_bitmap.GetWidth(), npc_bitmap.GetHeight())

          npc_regions.push(npc_region)

        end for

        ' addAnimatedImage
        m.addAnimatedImage(m.game.npc.config[i].entity.name.toStr() + "_" + m.game.npc.config[i].id.toStr(), npc_regions, { index: m.game.npc.getIndex(i)
          offset_x: m.game.npc.getEntityPosX(i),
          offset_y: m.game.npc.getEntityPosY(i)
        })

      end if
      
    end for

  end function
  

  object.onUpdate = function(dt as float)

    m.entityGen()

  end function
      
end function