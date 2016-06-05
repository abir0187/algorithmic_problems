# This is a classic matrix spiral traversal problem with a twist. This class will traverse the matrix in spiral form
# starting from the center and going outward. So if you have a matrix (2D array),
# 1, 2, 3
# 4, 5, 6
# 7, 8, 9
# then this will print 5, 6, 9, 8, 7, 4, 1, 2, 3!
# For the correctness of the problem and the algorithm, this assumes that the matrix is NXN where N is an odd number.
class MatrixSpiralTraversal

  # Keeps track of top, left, bottom and right and does the traversal. It designates the task to four private methods.
  # It returns when all the items are added to the result buffer.
  def spiral_traverse_from_center(matrix)
    if (matrix==nil || matrix.length==0 || matrix[0].length%2==0 || matrix[0].length!=matrix.length)
      return nil
    end

    result = []
    counter = 0
    top = matrix.length / 2
    left = top
    bottom = top
    right = top+1

    while true
      counter = left_right_traverse(left, right, top, counter, matrix, result)
      return result if full_count?(counter, matrix)

      bottom = bottom+1

      counter = top_bottom_traverse(top, bottom, right, counter, matrix, result)
      return result if full_count?(counter, matrix)

      left = left - 1

      counter = right_left_traverse(right, left, bottom, counter, matrix, result)
      return result if full_count?(counter, matrix)

      top = top - 1

      counter = bottom_top_traverse(bottom, top, left, counter, matrix, result)
      return result if full_count?(counter, matrix)

      right = right + 1
    end

  end

  private

  # Returns true when counter is the sum of all items in the matrix, i.e, matrix[0].length*matrix.length.
  def full_count?(counter, matrix)
    (counter == matrix[0].length*matrix.length)
  end

  # Does a left to right traverse. To avoid duplicates, it does an iteration till right-1. It returns a counter when
  # it is done.
  def left_right_traverse(left, right, top, counter, matrix, result)
    (left..right-1).each do |i|
      counter = counter + 1
      result << matrix[top][i]
      break if full_count?(counter, matrix)
    end
    counter
  end

  # Does a top to bottom traverse. To avoid duplicates, it does an iteration till bottom-1. It returns a counter when
  # it is done.
  def top_bottom_traverse(top, bottom, right, counter, matrix, result)
    (top..bottom-1).each do |i|
      counter = counter + 1
      result << matrix[i][right]
      break if full_count?(counter, matrix)
    end
    counter
  end

  # Does a right to left traverse. To avoid duplicates, it does an iteration till left+1. It returns a counter when
  # it is done.
  def right_left_traverse(right, left, bottom, counter, matrix, result)
    right.downto(left+1) do |i|
      counter = counter + 1
      result << matrix[bottom][i]
      break if full_count?(counter, matrix)
    end
    counter
  end

  # Does a bottom to top traverse. To avoid duplicates, it does an iteration till top+1. It returns a counter when
  # it is done.
  def bottom_top_traverse(bottom, top, left, counter, matrix, result)
    bottom.downto(top+1) do |i|
      counter = counter + 1
      result << matrix[i][left]
      break if full_count?(counter, matrix)
    end
    counter
  end

end
