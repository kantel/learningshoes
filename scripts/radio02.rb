# encoding: utf-8

Shoes.app do
  stack do
    para "Welcher dieser Klassiker der Reiseliteratur ist Dein Favorit?"
    flow do
      radio :books
      para "Spaziergang nach Syrakus"
    end
    flow do
      radio :books
      para "Die italienische Reise"
    end
    flow do
      radio :books
      para "Ein Pyrenäenbuch"
    end
  end
end
