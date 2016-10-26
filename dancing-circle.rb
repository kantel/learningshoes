Shoes.app :widht => 800, :height => 400 do
  
  @o = oval :top => 0, :left => 0, :radius => 40, :fill => red
  
  flow :width => 800, :margin => 40 do
    stack :width => "100%" do
      title "Tanz mit dem roten Mond"
      subtitle "Wie stolz und rund."
    end
  end
  
  motion do |x, y|
    @o.move width - x, height - y
  end
  
end