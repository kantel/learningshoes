# encoding: utf-8

Shoes.app width: 500, height: 500, title: "Das ist kein Cantor-Käse", resizable: false do
  strokewidth 1
  nofill
  
  def cheese(x, y, r, level)
    oval x, y, r, center: true
    if level > 1
      cheese(x - r/2, y, r/2, level-1)
      cheese(x + r/2, y, r/2, level-1)
    end
  end
  
  cheese(250, 250, 250, 10)
end