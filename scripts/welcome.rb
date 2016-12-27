Shoes.app(title: "Willkommen zu Shoes!", width: 600, height: 400) do
  stack margin: 10 do
    background white
    
    stack margin: 10 do
      background gainsboro
      subtitle "Wolltest Du nicht ein GUI bauen?"
      tagline "Mit Shoes geht das ohne viel Aufwand."
    end
    
    flow margin: 10 do
      buttons = {
        search: "Suchen",
        printer: "Drucken",
        notes: "Notizen",
        photo: "Photos",
        blueray: "Brennen"
      }
      
      buttons.each do |key, value|
        stack width: 100 do
          image "images/#{key.to_s}.png"
          para value
        end
      end
    end
    
    stack margin: 10 do
      background gainsboro
      para "Was ich gerne basteln möchte …"
      list_box items: ["Mein eigenes Twitter GUI", "Eine eigene Musikbox", "Eine Zeitmaschine"]
      button "Kein Problem …"
    end
  end
end