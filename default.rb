module Default

  Acceleration = 0.5
  TurnSpeed = 4.5
  Speed = 100
  Angle = 0.0

  module World
    Drag = 0.96 #0.95
  end

  module Player
    Acceleration = 0.35
    TurnSpeed = 4.5
    Speed = 5
    Angle = 0.0
  end

  module Projectile
    MaxDistance = 300.0
    Speed = 9.0
    TTL = 60 * 600.0
  end
end