Shoes.app :width => 520, :height => 500 do

  stack :margin => 20 do
    image "images/schuh01.jpg", :click => "http://www.flickr.com/photos/schockwellenreiter/2151239639/"
  end
  
  stack :margin => 20 do
    para "Das ist ein ", link("Navigationsschuh", :click => "http://www.flickr.com/photos/schockwellenreiter/2151239639/"), ", die Wetterseite ist bemoost."
  end
  
end