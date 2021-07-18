function npc_entity(object)

  object.funcName = "npc_entity"

  object.onCreate = function(args)

  end function


  object.entityLoad = function(i)

    m.npc_regions = []

    for j = 0 to m.game.npc.config[i].entity.anim.reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.npc.getReg(i, j).toStr()) = invalid
        ' loadBitmap
        m.game.loadBitmap(m.funcName + "_" + m.game.npc.getReg(i, j).toStr(), "pkg:/media/npc/sprites/" + m.game.npc.getReg(i, j).toStr() + ".png")
      end if
      
      ' getBitmap
      npc_bitmap = m.game.getBitmap(m.funcName + "_" + m.game.npc.getReg(i, j).toStr())
  
      ' roRegion
      npc_region = CreateObject("roRegion", npc_bitmap, 0, 0, npc_bitmap.GetWidth(), npc_bitmap.GetHeight())

      m.npc_regions.push(npc_region)

    end for
    
  end function

  object.entityUnload = function(i)

    for j = 0 to m.game.npc.config[i].entity.anim.reg.Count() - 1

      if m.game.getBitmap(m.funcName + "_" + m.game.npc.getReg(i, j).toStr()) <> invalid
        ' unloadBitmap
        m.game.unloadBitmap(m.funcName + "_" + m.game.npc.getReg(i, j).toStr())
      end if

    end for

  end function


  object.entityGen = function()

    ' load & add
    for i = 0 to m.game.npc.config.Count() - 1
      if - m.game.xy.getZeroOffsetX() <= m.game.npc.getEntityOffsetX(i) + m.game.npc.getEntityW(i) and - m.game.xy.getZeroOffsetX() + m.game.screen.GetWidth() >= m.game.npc.getEntityOffsetX(i) and - m.game.xy.getZeroOffsetY() <= m.game.npc.getEntityOffsetY(i) + m.game.npc.getEntityH(i) and - m.game.xy.getZeroOffsetY() + m.game.screen.GetHeight() >= m.game.npc.getEntityOffsetY(i)
        if m.getImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()) = invalid

          ' load
          m.entityLoad(i)

          ' add
          m.addAnimatedImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr(), m.npc_regions, { index: m.game.npc.getIndex(i)
            offset_x: m.game.npc.getEntityOffsetX(i),
            offset_y: m.game.npc.getEntityOffsetY(i)
          })
  
        end if

      ' unload & remove
      else if m.getImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid

        ' unload
        m.entityUnload(i)

        ' remove
        m.removeImage(m.game.npc.getEntityName(i).toStr() + "_" + i.toStr())

      end if
      
    end for

  end function
  

  object.onUpdate = function(dt as float)

    m.entityGen()

  end function
      
end function