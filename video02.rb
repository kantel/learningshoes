# encoding: utf-8

require 'shoes/videoffi'
Vlc.load_lib

Shoes.app  width: 648, height: 520, title: "Der kleine Sheltie (jetzt mit Video-Knöpfchen)" do
  stack margin: 4 do
    @myVideo = video("video/sheltie.mp4", autoplay: false)
  end
  para "Controls: ",
  link("Play") {@myVideo.play()}, ", ",
  link("Pause") {@myVideo.pause()}, ", ",
  link("Stop") {@myVideo.stop()}, ", ",
  link("+ 5 sec") {@myVideo.time = @myVideo.time() + 5000}, ", ",
  link("Begin") {@myVideo.position = 0.0}, ", ",
  link("End") {@myVideo.position = 0.99}
end
