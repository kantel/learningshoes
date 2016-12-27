# encoding: utf-8

Shoes.app(title: "Shoes GUI", width: 600, height: 400) do
    
    stack margin: 10 do
      background gainsboro
      subtitle "Wolltest Du nicht immer schon ein GUI bauen?"
      tagline "Aber das war Dir einfach zu kompliziert?"
    end
    
    stack margin: 10 do
      flow do
        buttons = {
          find: "Suchen",
          documents: "Finden",
          programs: "Ausführen",
          run: "Warten",
          logoff: "Abschließen"
        }
    
        buttons.each do |key, value|
          stack width: 100 do
            image "images/#{key.to_s}.gif"
            para value
          end
        end
      end
    end
  
    stack margin: 10 do
      background gainsboro
      para "Ich möchte gerne …"
      flow do
        list_box items: ["Eine eigene Twitter GUI", "Meinen eigenen Musik-Player", "Ein Pony!!!"]
        button "Kein Problem, leg los!"
      end
    end
end                  