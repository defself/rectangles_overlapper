# frozen_string_literal: true

require 'rspec'
require_relative '../solution/rectangle'

RSpec.describe Rectangle do
  let(:subject) { rectangle_1.overlaps?(rectangle_2) }
  2.times do |i|
    let("rectangle_#{i + 1}".to_sym) do
      top_left = corners_list[i].x
      bottom_right = corners_list[i].y

      Rectangle.new(
        top_left[0], top_left[1],
        bottom_right[0], bottom_right[1]
      )
    end
  end

  context 'overlaps' do
    [
      [
        [5, 15], [9, 4],
        [7, 11], [17, 6]
      ],
      [
        [7, 11], [17, 6],
        [5, 15], [9, 4]
      ],
      [
        [1, 5], [8, 1],
        [8, 9], [15, 5]
      ],
      [
        [8, 9], [15, 5],
        [1, 5], [8, 1]
      ],
      [
        [3, 12], [13, 6],
        [4, 11], [12, 7]
      ],
      [
        [4, 11], [12, 7],
        [3, 12], [13, 6]
      ],
      [
        [10, 10], [20, 5],
        [5, 8], [21, 4]
      ],
      [
        [5, 8], [21, 4],
        [10, 10], [20, 5]
      ],
      [
        [5, 8], [21, 4],
        [4, 7], [20, 3]
      ],
      # Rectangles are same
      [
        [5, 8], [21, 4],
        [5, 8], [21, 4]
      ],
      # Negative coordinates cases
      [
        [-10, -1], [-1, -6],
        [-9, -2], [-2, -5]
      ],
      # And reverse
      [
        [-9, -2], [-2, -5],
        [-10, -1], [-1, -6]
      ]
    ].each do |test_case|
      let(:corners_list) do
        [
          Corner.new(*test_case[..1]),
          Corner.new(*test_case[2..])
        ]
      end

      it { is_expected.to be true }
    end
  end

  context 'does not overlap' do
    [
      [
        [4, 4], [3, 3],
        [2, 2], [1, 1]
      ],
      [
        [1, 9], [7, 4],
        [12, 16], [17, 6]
      ],
      [
        [12, 16], [17, 6],
        [1, 9], [7, 4]
      ],
      [
        [5, 9], [12, 5],
        [9, 15], [15, 10]
      ],
      [
        [9, 15], [15, 10],
        [5, 9], [12, 5]
      ]
    ].each do |test_case|
      let(:corners_list) do
        [
          Corner.new(*test_case[..1]),
          Corner.new(*test_case[2..])
        ]
      end

      it { is_expected.to be false }
    end
  end
end
