# encoding: utf-8


Shoes.app width: 500, height: 500, title: "Mira-Fraktal", resizable: false do
  background black
  nostroke
  fill white
  
  b = 0.93
  a = -0.58

  
  def mira(xn, an)
    an*xn - (1.0 - an)*((2*xn*xn)/(1.0 + xn*xn))
  end
  
  x = 4.0
  y = 0.0
  for i in 1..120 do
    x1 = b*y + mira(x, a)
    y  = -x + mira(x, a)
    x  = x1
    oval (350 + (x*26)), (280 - (y*26)*width), 20, center: true
  end
  

end