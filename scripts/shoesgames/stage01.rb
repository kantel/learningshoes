# encoding: utf-8

xspeed, yspeed = 4, 4
xdir, ydir = 1, 1

Shoes.app :widht => 800, :height => 400 do
  background green
  @herolf1 = image "images/mnv1_lf1.gif"
  @herolf2 = image "images/mnv1_lf2.gif"
  @herort1 = image "images/mnv1_rt1.gif"
  @herort2 = image "images/mnv1_rt2.gif"
  @herolf1.hide
  @herolf2.hide
  @herort1.hide
  @herort2.hide
  @hero = @herolf1

  x, y = self.width/2, self.height/2
  size = @hero.size
  
  animate(15) do
    x += xspeed * xdir
    @hero.move x.to_i, y.to_i
    
    if xdir == 1 then
      #@herolf1.hide
      #@herolf2.hide
      if @hero == @herort2 then
        @hero = @herort1
        @herort1.show
        @herort2.hide
      else
        @hero = @herort2
        @herort2.show
        @herort1.hide
      end
    end
    
    if xdir == -1 then
      #@herort1.hide
      #@herort2.hide
      if @hero == @herolf1 then
        @hero = @herolf2
        @herolf2.show
        @herolf1.hide
      else
        @hero = @herolf1
        @herolf1.show
        @herolf2.hide
      end
    end

    xdir *= -1 if x > self.width - size[0] or x < 0
  end
end