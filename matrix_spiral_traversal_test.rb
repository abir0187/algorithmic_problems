require_relative "matrix_spiral_traversal"
require "test/unit"

class MatrixSpiralTraversalTest < Test::Unit::TestCase

  def setup
    @matrixTraversal = MatrixSpiralTraversal.new
  end

  def test_traversal_when_nil_matrix
    assert_equal(@matrixTraversal.spiral_traverse_from_center(nil), nil)
  end

  def test_traversal_when_zero_matrix
    assert_equal(@matrixTraversal.spiral_traverse_from_center([[]]), nil)
  end

  def test_traversal_when_even_matrix
    matrix = [[1, 2],
              [4, 5]
    ]
    assert_equal(@matrixTraversal.spiral_traverse_from_center(matrix), nil)
  end

  def test_traversal_when_bad_matrix
    matrix = [[1, 2, 3],
              [4, 5, 3]
    ]
    assert_equal(@matrixTraversal.spiral_traverse_from_center(matrix), nil)
  end

  def test_traversal_when_good_matrix
    matrix = [[1, 2, 3],
              [4, 5, 6],
              [7, 8, 9]
    ]
    assert_equal(@matrixTraversal.spiral_traverse_from_center(matrix), [5, 6, 9, 8, 7, 4, 1, 2, 3])

    matrix = [[3, 22, 323],
              [4, 55, 65],
              [72, 38, 29]
    ]
    assert_equal(@matrixTraversal.spiral_traverse_from_center(matrix), [55, 65, 29, 38, 72, 4, 3, 22, 323])

    matrix = [[1, 2, 3, 9, 7],
              [4, 5, 6, 2, 1],
              [7, 8, 9, 0, 0],
              [3, 8, 2, 6, 1],
              [4, 5, 2, 3, 1]
    ]
    assert_equal(@matrixTraversal.spiral_traverse_from_center(matrix), [9, 0, 6, 2, 8, 8, 5, 6, 2, 1, 0, 1, 1, 3, 2, 5, 4, 3, 7, 4, 1, 2, 3, 9, 7])

    matrix = [[20, 21, 22, 23, 24],
              [19, 6, 7, 8, 9],
              [18, 5, 0, 1, 10],
              [17, 4, 3, 2, 11],
              [16, 15, 14, 13, 12]
    ]
    assert_equal(@matrixTraversal.spiral_traverse_from_center(matrix), [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])

  end

end