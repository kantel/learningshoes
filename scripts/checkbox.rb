# encoding: utf-8

Shoes.app do
  @list = ["Spaziergang nach Syrakus", "Die italienische Reise", "Ein Pyrenäenbuch", "Wanderungen durch die Mark Brandenburg"]
  
  para "Welche dieser Klassiker der Reiseliteratur hast Du gelesen?"
  
  stack do
    @list.map! do |name|
      flow {@c = check; para name}
      [@c, name]
    end
    
    button "Deine Auswahl?" do
      selected = @list.map {|c, name| name if c.checked?}.compact
      alert selected.join(", ") if not selected.empty?
    end
  end
end
