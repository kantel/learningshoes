# encoding: utf-8

xspeed, yspeed = 8.4, 6.6
xdir, ydir = 1, 1

Shoes.app do
  background white
  border black, :strokewidth => 6

  nostroke
  @ball = image "images/fussball.png", :left => 100, :top => 100 do
    alert "Du klickst so schnell, Jörg!"
  end

  x, y = self.width/2, self.height/2
  size = @ball.size
  animate(30) do
    x += xspeed * xdir
    y += yspeed * ydir
    
    xdir *= -1 if x > self.width - size[0] or x < 0
    ydir *= -1 if y > self.height - size[1] or y < 0

    @ball.move x.to_i, y.to_i
  end
end