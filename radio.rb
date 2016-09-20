# encoding: utf-8

Shoes.app do
  @list = ["Spaziergang nach Syrakus", "Die italienische Reise", "Ein Pyrenäenbuch", "Wanderungen durch die Mark Brandenburg"]
  
  para "Welcher dieser Klassiker der Reiseliteratur ist Dein Favorit?"
  
  stack do
    @list.map! do |name|
      flow {@r = radio :books; para name}
      [@r, name]
    end
    
    button "Deine Auswahl?" do
      selected = @list.map {|r, name| name if r.checked?}.compact
      alert selected.join if not selected.empty?
    end
  end
end
