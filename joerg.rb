Shoes.app :width => 600, :height => 400 do
  flow :width => 600, :margin => 20 do
    stack :width => "100%" do
      banner "Jörg Kantel"
    end
    
    stack :width => "270px" do
      image "images/joerg_kantel.jpeg"
    end
    stack :width => "-280px" do
      para "Netzaktivist und Blogger"
      para "Begeisterter Hundesportler"
      para "Lebt in Neukölln"
      para "… und lernt jetzt Ruby!"
    end
  end
end