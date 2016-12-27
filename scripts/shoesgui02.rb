# encoding: utf-8

Shoes.app(title: "Shoes GUI 95", width: 600, height: 400) do
    
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
            image "images/#{key.to_s}.gif"; click{alert "Hallo #{value}!"}
            para value
          end
        end
      end
    end
  
    stack margin: 10 do
      background gainsboro
      para "Ich möchte gerne …"
      flow do
        @l = list_box items: ["Eine eigene Twitter GUI", "Meinen eigenen Musik-Player", "Ein Pony!!!"]
        button "Kein Problem, leg los!" do
          alert @l.text
        end
        @l.change do
          @changes.clear do
            para "Du hast ", em("»#{@l.text}«"), " ausgewählt!"
          end
        end
      end
    end
    
    @changes = stack margin: 5
end                  