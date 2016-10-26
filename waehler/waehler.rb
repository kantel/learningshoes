FPS = 25
REP = 0
DEM = 1
ROW = 10
COL = 10
ICON_SIZE = 34
WORLD = {:xmax => ICON_SIZE*ROW, :ymax => ICON_SIZE*COL}

Shoes.app(:title => "WAEHLER", :width => WORLD[:xmax], :height => WORLD[:ymax]) do
  $neighboorhood = []
  i = 0
  while (i < ROW) do
    j = 0
    while (j < COL) do
      r = rand()
      if (r.round == REP) then
        $neighboorhood[i + j*ROW] = REP
        image "images/rep.png"
      else
        $neighboorhood[i + j*ROW] = DEM
        image "images/dem.png"
      end
      j += 1
    end
    i += 1
  end
  
  animate(FPS) do
    actorX = rand(ROW).round
    actorY = rand(COL).round
    moore = rand(8).round
    case moore
    when 0
      neighboorX = actorX
      neighboorY = actorY - 1
    when 1
      neighboorX = actorX + 1
      neighboorY = actorY - 1
    when 2
      neighboorX = actorX + 1
      neighboorY = actorY
    when 3
      neighboorX = actorX + 1
      neighboorY = actorY + 1
    when 4
      neighboorX = actorX
      neighboorY = actorY + 1
    when 5
      neighboorX = actorX - 1
      neighboorY = actorY + 1
    when 6
      neighboorX = actorX - 1
      neighboorY = actorY
    when 7
      neighboorX = actorX - 1
      neighboorY = actorY - 1
    end
    
    if (neighboorX < 0) then
      neighboorX = ROW + neighboorX
    end
    neighboorX = neighboorX % ROW
    
    if neighboorY < 0 then
      neighboorY = COL + neighboorY
    end
    neighboorY = neighboorY % COL
    
    if ($neighboorhood[neighboorX + neighboorY*ROW] == DEM) then
      $neighboorhood[actorX + actorY*ROW] = DEM
    else
      $neighboorhood[actorX + actorY*ROW] = REP
    end
    clear do
      k = 0
      while (k < $neighboorhood.length) do
        if ($neighboorhood[k] == REP) then
          image "images/rep.png"
        else
          image "images/dem.png"
        end
        k += 1
      end  
    end
  end
end