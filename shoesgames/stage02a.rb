# encoding: utf-8

FPS = 5  # Frames per Second
TS  = 32  # Tilesize
STEP = TS/4

xspeed, yspeed = 4, 3
xdir, ydir = 1, 1

Shoes.app :width => 640, :height => 320, :resizable => false do
  background "images/map2.png"
  x, y = self.width/2, self.height/2
  hero = image "images/mnv1_rt2.gif", :left => x, :top => y
  size = hero.size
  nostroke
  
  animate(FPS) do |frame|
    keypress do |k|
      if k == :right then
        hero.path = "images/mnv1_rt1.gif"
        for i in 1..8 do
          x += 4
          if i % 8 == 0 then
            hero.path = "images/mnv1_rt2.gif"
          else
            hero.path = "images/mnv1_rt1.gif"
          end
          hero.move x.to_i, y.to_i
        end
      elsif k == :left then
        hero.path = "images/mnv1_lf1.gif"
        for i in 1..8 do
          x -= 4
          if i%2 == 0 then
            hero.path = "images/mnv1_lf2.gif"
          else
            hero.path = "images/mnv1_lf1.gif"
          end
          hero.move x.to_i, y.to_i
        end
      elsif k == :up then
        hero.path = "images/mnv1_bk1.gif"
        for i in 1..8 do
          y -= 4
          if i%2 == 0 then
            hero.path = "images/mnv1_bk2.gif"
          else
            hero.path = "images/mnv1_bk1.gif"
          end
          hero.move x.to_i, y.to_i
        end
      elsif k == :down then
        hero.path = "images/mnv1_fr1.gif"
        for i in 1..8 do
          y += 4
          if i%2 == 0 then
            hero.path = "images/mnv1_fr2.gif"
          else
            hero.path = "images/mnv1_fr1.gif"
          end
          hero.move x.to_i, y.to_i
        end
      else
        puts "Nicht unterstützte Taste"
      end
      # hero.move x.to_i, y.to_i
    end
  end

end
