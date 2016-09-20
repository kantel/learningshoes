# encoding: utf-8

Shoes.app(title: "Fortschrittsbalken", width: 250, height: 50) do
  stack margin: 10 do
    @f = progress width: 230
    animate do |i|
      @f.fraction = (i%100)/100.0
    end
  end
end
