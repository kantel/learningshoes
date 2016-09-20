# encoding: utf-8

Shoes.app do
  stack do
    para "Ich möchte gerne …"
    flow do
      @l = list_box items: ["Eine eigene Twitter GUI", "Meinen eigenen Musik-Player", "Ein Pony!!!"]
      button "Kein Problem, leg los!" do
        alert @l.text
      end
      @l.change do
        @changes.clear do
          para "Du hast »#{@l.text}« ausgewählt!"
          end
        end
      end
    end
    @changes = stack
end
