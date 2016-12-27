# encoding: utf-8

Shoes.app(title: "Mein Notizbuch", width: 250, height: 600) do
  stack margin: 20 do
    para "Raum für Notizen"
    @add = edit_box "Eine Notiz eingeben …", width: 200, height: 200
    button "Sichern" do
      @notes.append do
        para @add.text, " ", link("Löschen") {|x| x.parent.remove}
      end
      @add.text = ""
    end
  end
  @notes = stack margin: 20
end
