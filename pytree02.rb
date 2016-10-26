# encoding: utf-8

# Pythagorasbaum
# Nach einem Pascal-Programm aus: Dietmar Herrmann: Algorithmen für Chaos und Fraktale,
# Bonn (Addison-Wesly) 1994, S. 168-170

Shoes.app  width: 640, height: 480, title: "Pythagoras-Baum", resizable: false do
  
  strokewidth 1
  background white
  
  C = 0.707107   # 1/sqrt(2)
  G1 = 6.5        # Gewichtungsfaktor
  G2 = 2.0
  Aspect = 0.51
  d = Array(10)
  palette = [maroon, sienna, sandybrown, darkseagreen, mediumseagreen, lightgreen, darkolivegreen, lawngreen, forestgreen, green, darkgreen]
  
  u, v, = 1.0, 1.0
  for m in 0..10
    p = 1
    for k in 0..m
      p = 2*p
      for n in p..(2*p - 1)
        l = n
        h = 1
        for k in 0..(m - 1)
          d[m-k] = l%2
          l = l/2
        end
        x, y, f = 0.0, 0.0, 0.0
        for j in 1..m
          if d[j] == 0
            x = x - h*(Math.cos(f) + 2*Math.sin(f))
            y = y + h*(2*Math.cos(f) - Math.sin(f))
            f = f + Math::PI/6
          else
            x = x + h*(Math.cos(f) - 2*Math.sin(f))
            y = y + h*(2*Math.cos(f) + Math.sin(f))
            f = f - Math::PI/4
          end
          h = C*h
        end
        u = h*(Math.cos(f) + Math.sin(f))
        v = h*(Math.cos(f) - Math.sin(f))
        u *= Aspect
        v *= Aspect
        shape do
          fill palette[m]
          move_to((48*(x - v + G1)).round, 480-(48*(y - u + G2)).round)
          line_to((48*(x + u + G1)).round, 480-(48*(y - v + G2)).round)
          line_to((48*(x + v + G1)).round, 480-(48*(y + u + G2)).round)
          line_to((48*(x - u + G1)).round, 480-(48*(y + v + G2)).round)
          line_to((48*(x - v + G1)).round, 480-(48*(y - u + G2)).round)
        end
      end
    end
  end
end