# frozen_string_literal: true

require_relative './corner'

class Rectangle
  attr_reader :top_left, :top_right, :bottom_left, :bottom_right

  def initialize(x_top_left, y_top_left, x_bottom_right, y_bottom_right)
    @top_left = Corner.new(x_top_left, y_top_left)
    @bottom_right = Corner.new(x_bottom_right, y_bottom_right)

    @top_right = Corner.new(x_bottom_right, y_top_left)
    @bottom_left = Corner.new(x_top_left, y_bottom_right)
  end

  def overlaps?(other_rectangle)
    return false if above_top_edge?(other_rectangle.bottom_right)
    return false if below_bottom_edge?(other_rectangle.bottom_left)
    return false if on_left_side_of_left_edge?(other_rectangle.top_right)
    return false if on_right_side_of_right_edge?(other_rectangle.top_left)

    true
  end

  private

  def above_top_edge?(rectangle_bottom_right)
    top_left.x > rectangle_bottom_right.x || top_left.y < rectangle_bottom_right.y
  end

  def below_bottom_edge?(rectangle_bottom_left)
    top_right.x < rectangle_bottom_left.x || top_right.y < rectangle_bottom_left.y
  end

  def on_left_side_of_left_edge?(rectangle_top_right)
    bottom_left.x > rectangle_top_right.x || bottom_left.y > rectangle_top_right.y
  end

  def on_right_side_of_right_edge?(rectangle_top_left)
    bottom_right.x < rectangle_top_left.x || bottom_right.y > rectangle_top_left.y
  end
end
