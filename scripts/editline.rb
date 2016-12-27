# encoding: utf-8

Shoes.app(title: "Hallo Texteingabe", width: 600, height: 150) do
  stack margin: 25 do
    para "Wie ist Dein Name?"
    flow do
      @l = edit_line width: 450
      button("Hallo!") do 
        alert ("Hallo #{@l.text}!")
      end
    end
  end
end