# encoding: utf-8

FPS = 15
num_orcs = 15
orcs = Array.new(num_orcs)
speed = Array.new(num_orcs)
x = Array.new(num_orcs)
y = Array.new(num_orcs)

Shoes.app width: 932, height: 320, title: "Running Orcs" do
  background "images/map.png"
  for i in 0..num_orcs do
    x[i] = rand(900)
    y[i] = rand(100)*-1 - 48
    orcs[i] = image "images/orc1.png", left: x[i], top: y[i]
    speed[i] = rand(5) + 5
  end
  
  animate(FPS) do |frame|    
    
    for i in 0..num_orcs do
      y[i] += speed[i]
      if (frame + i) % 4 == 1
        orcs[i].path = "images/orc1.png"
      elsif (frame + i) % 4 == 3
        orcs[i].path = "images/orc3.png"
      else
        orcs[i].path = "images/orc2.png"
      end
      orcs[i].move x[i], y[i]
      if y[i] >= 320 then
        x[i] = rand(900)
        y[i] = rand(100)*-1 - 48
        speed[i] = rand(5) + 5
      end
    end
  end
  
end