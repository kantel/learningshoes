# encoding: utf-8

Shoes.app do
  stack do
    para "Welcher dieser Klassiker der Reiseliteratur ist Dein Favorit?"
    flow {radio; para "Spaziergang nach Syrakus"}
    flow {radio; para "Die italienische Reise"}
    flow {radio; para "Ein Pyrenäenbuch"}
  end
end
