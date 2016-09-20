# encoding: utf-8

FPS = 6
x = 144
y = 48

Shoes.app width: 320, height: 240, title: "Rogue" do
  background "images/underworld.png"
  rogue = image "images/rogue0.png", left: x, top: y
  lighta = image "images/light0.png", left: 96, top: 0
  lightb = image "images/light0.png", left: 208, top: 0
    
  animate(FPS) do |frame|
    if frame % 2 == 0
      lighta.path = "images/light0.png"
      lightb.path = "images/light0.png"
    else
      lighta.path = "images/light1.png"
      lightb.path = "images/light1.png"
    end
    
    if frame % 6 < 3
      rogue.path = "images/rogue0.png"
    else
      rogue.path = "images/rogue1.png"
    end

    
    keypress do |k|
      if k == :left
        if x > 0
          x = x - 16
        end
      elsif k == :right
        if x < 320-16
          x = x + 16
        end
      elsif k == :up
        if y > 0
          y = y - 16
        end
      elsif k == :down
        if y < 240-16
          y = y +  16
        end
      end
    end
    
    rogue.move x, y
    
  end
  
end