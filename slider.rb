# encoding: utf-8

Shoes.app do
    stack margin: 10 do
        flow do
            @sl = slider fraction: 0.50 do |sd|
                @p.text = "Wert: #{(sd.fraction)}"
            end
            @p = para "", margin_left: 10
        end
    end
end 