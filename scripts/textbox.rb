# encoding: utf-8

Shoes.app do
  para "Dein Name?"
  @name = edit_line
  button "Hinzufügen" do
    @names.append do
      para @name.text
    end
    @name.text = ""
  end
  @names = stack
end