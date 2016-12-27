# encoding: utf-8

xspeed, yspeed = 10.0, 7.0
xdir, ydir = 1, 1
size = 50

Shoes.app width: 500, height: 500, title: "Bouncing Ball", resizable: false do
  background black
  nostroke
  fill white
  @ball = oval 0, 0, size
  x, y = self.width/2, self.height/2
  # size = 50

  animate(30) do
    x += xspeed * xdir
    y += yspeed * ydir
    
    xdir *= -1 if x > self.width - size or x < 0
    ydir *= -1 if y > self.height - size or y < 0

    @ball.move x.to_i, y.to_i
  end
end