# encoding: utf-8

FPS = 15

xspeed, yspeed = 4, 3
xdir, ydir = 1, 1

Shoes.app :width => 640, :height => 320, :resizable => false do
  background "images/terrain.png"
  gold = image "images/gold.gif", :left => 120, :top => 128
  x, y = self.width/2, self.height/2
  hero = image "images/mnv1_rt1.gif", :left => x, :top => y
  size = hero.size
  nostroke
  
  animate(FPS) do |frame|

    x += xspeed * xdir
    y += yspeed * ydir
    
    xdir *= -1 if x > self.width - size[0] or x < 0
    ydir *= -1 if y > self.height - size[1] or y < 0
    
    if xdir == 1 then
      if frame % 2 == 0 then
        hero.path = "images/mnv1_rt1.gif"
      else
        hero.path = "images/mnv1_rt2.gif"
      end
    end
    
    if xdir == -1 then
      if frame % 2 == 0 then
        hero.path = "images/mnv1_lf1.gif"
      else
        hero.path = "images/mnv1_lf2.gif"
      end
    end
    
    hero.move x.to_i, y.to_i
    
  end
end