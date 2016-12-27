# encoding: utf-8

require 'shoes/videoffi'

Shoes.app  width: 640, height: 480, title: "Der kleine Sheltie" do
  video("video/sheltie.mp4", autoplay: true)
end
