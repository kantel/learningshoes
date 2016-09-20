#! encoding: utf-8

require "matrix"

FPS = 24
ROID_SIZE = 6
WORLD = {:xmax => ROID_SIZE * 100, :ymax => ROID_SIZE * 100}
POPULATION_SIZE = 50

SEPARATION_RADIUS = ROID_SIZE*5
ALIGNMENT_RADIUS  = ROID_SIZE*35
COHESION_RADIUS   = ROID_SIZE*35

SEPARATION_ADJUSTMENT = 10
ALIGNMENT_ADJUSTMENT  = 8
COHESION_ADJUSTMENT   = 100
MAX_ROID_SPEED        = 40
CENTER_RADIUS         = ROID_SIZE*12

class Vector
  def /(x)
    if (x != 0)
      Vector[self[0]/x.to_f, self[1]/x.to_f]
    else
      self
    end
  end
end

class Roid
  attr_reader :velocity, :position
  
  def initialize(slot, p, v)
    @velocity = v
    @position = p
    @slot = slot
  end
  
  def distance_from(roid)
    distance_from_point(roid.position)
  end
  
  def distance_from_point(vector)
    x = self.position[0] - vector[0]
    y = self.position[1] - vector[1]
    Math.sqrt(x*x + y*y)
  end
  
  def nearby?(threshold, roid)
    return false if roid === self
    distance_from(roid) < threshold and within_fov?(roid)
  end
  
  def within_fov?(roid)
    v1 = self.velocity - self.position
    v2 = roid.position - self.position
    cos_angle = v1.inner_product(v2)/(v1.r*v2.r)
    Math.acos(cos_angle) < 0.75 * Math::PI
  end
  
  def draw
    @slot.oval :left => @position[0], :top => @position[1], :radius => ROID_SIZE, :center => true
    @slot.line @position[0], @position[1], @position[0] - @velocity[0], @position[1] - @velocity[1]
  end
  
  def move
    @delta = Vector[0, 0]
    %w(separate align cohere muffle center).each do |action|
      self.send action
    end
    @velocity += @delta
    @position += @velocity
    # allow_fallthrough and draw
    draw
  end
  
  def separate
    distance = Vector[0, 0]
    $roids.each do |roid|
      if nearby?(SEPARATION_RADIUS, roid)
        distance += self.position - roid.position
      end
    end
    @delta += distance/SEPARATION_ADJUSTMENT
  end
  
  def align
    nearby = 0
    average_velocity = Vector[0, 0]
    $roids.each do |roid|
      if nearby?(ALIGNMENT_RADIUS, roid)
        average_velocity += roid.velocity
        nearby += 1
      end
    end
    average_velocity /= nearby
    @delta += (average_velocity - self.velocity)/ALIGNMENT_ADJUSTMENT
  end
  
  def cohere
    nearby = 0
    average_p = Vector[0, 0]
    $roids.each do |roid|
      if nearby?(COHESION_RADIUS, roid)
        average_p += roid.position
        nearby += 1
      end
    end
    average_p /= nearby
    @delta += (average_p - self.position)/COHESION_ADJUSTMENT
  end
  
  def muffle
    if @velocity.r > MAX_ROID_SPEED
      @velocity /= @velocity.r
      @velocity *= MAX_ROID_SPEED
    end
  end
  
  def center
    @delta -= (@position - Vector[WORLD[:xmax]/2, WORLD[:ymax]/2])/CENTER_RADIUS
  end
    
  def allow_fallthrough
    x = case
    when @position[0] < 0 then WORLD[:xmax] + @position[0]
    when @position[0] > WORLD[:xmax] then WORLD[:xmax] - @position[0]
    else @position[0]
    end
    y = case
    when @position[1] < 0 then WORLD[:ymax] + @position[1]
    when @position[1] > WORLD[:ymax] then WORLD[:ymax] - @position[1]
    else @position[1]
    end
    @position = Vector[x, y]
  end
  
end

Shoes.app(:title => "Roids", :width => WORLD[:xmax], :height => WORLD[:ymax], :resizable => false) do
  stroke slategray
  fill black
  $roids = []
  POPULATION_SIZE.times do
    # random_location = Vector[rand(WORLD[:xmax]), rand(WORLD[:ymax])]
    start_location = Vector[WORLD[:xmax]/2, WORLD[:ymax]/2]
    start_velocity = Vector[rand(11)-5, rand(11)-5]
    $roids << Roid.new(self, start_location, start_velocity)
  end
  
  animate(FPS) do
    clear do
      # background gradient(rgb(134, 97, 91), rgb(218, 112, 50))
      background "images/sunset.jpg"
      $roids.each do |roid|
        roid.move
      end
    end
  end
end
