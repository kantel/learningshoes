# encoding: utf-8

class Adventure < Shoes
  url "/",           :start
  url "/firstpage",  :firstpage
  url "/secondpage", :secondpage
  
  def start
    background yellowgreen
    stack margin: 20 do
      banner strong("Du und das Altersheim")
    end
    stack margin: 20 do
      para "Als Du diesen Morgen im Altersheim aufwachtest, stelltest Du fest, daß Dein Rollator plötzlich mit Dir redete: »Ey Alter, wir müssen endlich mal wieder raus, was erleben!«"
      para strong("(1)"), ":  Mühsam kämpftest Du Dich aus dem Bett und gingst mit Deinem Rollator ",
      link("zum Fahrstuhl", click: "/firstpage"), ", um Dich in das Abenteuer der Großstadt zu stürzen."
      para strong("(2)"), ": Du drehtest dich einfach um und ",
      link("schliefst weiter", click: "/secondpage"), "."
    end
  end
  
  def firstpage
    background yellow
    flow margin: 20 do
      stack width: "320px" do
        image "images/fahrstuhldesgrauens.jpg"
      end
      stack width: "-320px", margin_left: 20 do
        para "Kurz bevor Du in den Fahrstuhl einsteigen wolltest, überkam Dich eine seltsame Ahnung, Du machtest auf der Stelle kehrt und ",
        link("gingst zurück ins Bett", click: "/secondpage"), "."
      end
    end
  end
  
  def secondpage
    background white
    stack margin: 20 do
     image "images/schlaf01.png"
   end
  end
end

Shoes.app width: 640, height: 480, resizable: false