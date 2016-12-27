Shoes.app :height => 200, :width => 200 do
  background lightblue
  stack :margin => 10 do
    caption strong "Shoes Stopuhr"
    flow do
      button "Start" do
        @time = Time.now
        @label.replace "Start um #{@time.strftime '%H:%M:%S'}."
      end
      button "Stop" do
        @label.replace "Gestoppt nach ", strong("#{Time.now - @time}"), " Sekunden."
      end
    end
    @label = para "Klicke ", strong("Start"), " um die Zeit zu stoppen."
  end
end
    