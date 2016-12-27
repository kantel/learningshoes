# encoding: utf-8

Shoes.app do
    stack margin: 10 do
      
      stack do
        # background rgb(@r, @g, @b)
        @sl = slider fraction: 0.9 do
          @r = @sl.fraction().to_f
          @p.text = @r.to_s
        end
        @p = para ""
      end
    end
end 