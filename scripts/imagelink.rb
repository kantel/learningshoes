# encoding: utf-8

Shoes.app do
  
  stack margin: 10 do
    flow do
      buttons = {
        find: "Suchen",
        documents: "Finden"
      }
      
      buttons.each do |key, value|
        stack width: 100 do
          image "images/#{key.to_s}.gif"; click{alert "Hallo #{value}!"}
          para value
        end
      end
    end
  end
end

#image "images/find.gif"; click{ alert "Hallo Bild!"}
