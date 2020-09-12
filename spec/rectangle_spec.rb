require 'rspec'
require './solution/Rectangle'

TestCase = Struct.new(:corners1, :corners2)
Corners = Struct.new(:top_left, :bottom_right) do
  def to_s
    "{TL = [#{top_left[0]}, #{top_left[1]}], BR = [#{bottom_right[0]}, #{bottom_right[1]}]}"
  end
end

RSpec.describe Rectangle do
  describe "should overlap having" do
    [
        TestCase.new(
            Corners.new([5, 15], [9, 4]),
            Corners.new([7, 11], [17, 6])
        ),
        TestCase.new(
            Corners.new([7, 11], [17, 6]),
            Corners.new([5, 15], [9, 4])
        ),
        TestCase.new(
            Corners.new([1, 5], [8, 1]),
            Corners.new([8, 9], [15, 5])
        ),
        TestCase.new(
            Corners.new([8, 9], [15, 5]),
            Corners.new([1, 5], [8, 1])
        ),
        TestCase.new(
            Corners.new([3, 12], [13, 6]),
            Corners.new([4, 11], [12, 7])
        ),
        TestCase.new(
            Corners.new([4, 11], [12, 7]),
            Corners.new([3, 12], [13, 6])
        ),
        TestCase.new(
            Corners.new([10, 10], [20, 5]),
            Corners.new([5, 8], [21, 4])
        ),
        TestCase.new(
            Corners.new([5, 8], [21, 4]),
            Corners.new([10, 10], [20, 5])
        ),
        TestCase.new(
            Corners.new([5, 8], [21, 4]),
            Corners.new([4, 7], [20, 3])
        ),
        # Rectangles are same
        TestCase.new(
            Corners.new([5, 8], [21, 4]),
            Corners.new([5, 8], [21, 4])
        ),
        # Negative coordinates cases
        TestCase.new(
            Corners.new([-10, -1], [-1, -6]),
            Corners.new([-9, -2], [-2, -5]),
        ),
        # And reverse
        TestCase.new(
            Corners.new([-9, -2], [-2, -5]),
            Corners.new([-10, -1], [-1, -6])
        ),
    ].each do |tc|
      it "#{tc.corners1} with rectangle having #{tc.corners2} corners" do
        rectangle1 = new_rectangle tc.corners1
        rectangle2 = new_rectangle tc.corners2

        expect(rectangle1.overlaps(rectangle2)).to be true
      end
    end
  end

  describe "should NOT overlap having" do
    [
        TestCase.new(
            Corners.new([4, 4], [3, 3]),
            Corners.new([2, 2], [1, 1])
        ),
        TestCase.new(
            Corners.new([1, 9], [7, 4]),
            Corners.new([12, 16], [17, 6])
        ),
        TestCase.new(
            Corners.new([12, 16], [17, 6]),
            Corners.new([1, 9], [7, 4])
        ),
        TestCase.new(
            Corners.new([5, 9], [12, 5]),
            Corners.new([9, 15], [15, 10])
        ),
        TestCase.new(
            Corners.new([9, 15], [15, 10]),
            Corners.new([5, 9], [12, 5])
        )
    ].each do |tc|
      it "#{tc.corners1} with rectangle having #{tc.corners2} corners" do
        rectangle1 = new_rectangle tc.corners1
        rectangle2 = new_rectangle tc.corners2

        expect(rectangle1.overlaps(rectangle2)).to be false
      end
    end
  end

  def new_rectangle(corners)
    Rectangle.new(
        corners.top_left[0], corners.top_left[1],
        corners.bottom_right[0], corners.bottom_right[1]
    )
  end
end
