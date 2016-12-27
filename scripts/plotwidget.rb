# encoding: utf-8

Shoes.app width: 560, height: 480 do
  
  @werte = [74, 77, 75, 79, 78, 78, 79, 81, 84, 86, 75, 75, 75, 89, 73, 83, 78, 78]
  @graph = plot 540, 460, title: "Shoes kann Graphen", caption: "Eine längere Ünterschrift mit Ümlautén", font: "Helvetica", auto_grid: true
  @graph.add num_obs: @werte.size, values: @werte, name: "Kein Aktienkurs", minv: 70, maxv: 90

end