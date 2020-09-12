require_relative './Corner'

class Rectangle
  attr_reader :top_left, :top_right, :bottom_left, :bottom_right

  def initialize(x_top_left, y_top_left, x_bottom_right, y_bottom_right)
    @top_left = Corner.new(x_top_left, y_top_left)
    @bottom_right = Corner.new(x_bottom_right, y_bottom_right)

    @top_right = Corner.new(x_bottom_right, y_top_left)
    @bottom_left = Corner.new(x_top_left, y_bottom_right)
  end


  def overlaps(rectangle)
    return false if top_left.x > rectangle.bottom_right.x || top_left.y < rectangle.bottom_right.y
    return false if top_right.x < rectangle.bottom_left.x || top_right.y < rectangle.bottom_left.y
    return false if bottom_left.x > rectangle.top_right.x || bottom_left.y > rectangle.top_right.y
    return false if bottom_right.x < rectangle.top_left.x || bottom_right.y > rectangle.top_left.y
    true
  end
end

