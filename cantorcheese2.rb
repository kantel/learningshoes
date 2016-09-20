# encoding: utf-8

Shoes.app width: 500, height: 500, title: "Cantors Doppel-Käse", resizable: false do
  strokewidth 1
  nofill
  
  LEVEL = 6
  
  def cheese(x, y, r, level)
    oval x, y, r, center: true
    if level > 1
      cheese(x - r/4, y, r/2, level-1)
      cheese(x, y - r/4, r/2, level-1)
      cheese(x + r/4, y, r/2, level-1)
      cheese(x, y + r/4, r/2, level-1)
    end
  end
  
  cheese(250, 250, 500, LEVEL)
end