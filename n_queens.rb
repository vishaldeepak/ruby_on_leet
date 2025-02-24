require 'debug'
def solve_n_queens(n)
  ans = [] 
  @result = []

  (0..n-1).each do |index|
    ans[index] = []
    (0..n-1).each do |inner_index|
      ans[index][inner_index] = '.'
    end
  end

  solve(ans, 0, 0, n)
  @result
end

def solve(ans, start_x, fixed, n)
  if fixed == n
    @result.push(ans.map(&:join))
    return 
  end

  (0..n-1).each do |inner_index|
    if valid?(ans, start_x, inner_index, n)
      ans[start_x][inner_index] = 'Q'
      
      solve(ans,start_x+1, fixed+1, n)
      ans[start_x][inner_index] = '.'
    end
  end
end


def valid?(ans, x, y, n)

  (0..x-1).each do |index|
    return false if ans[index][y] == 'Q'
  end

  i = x-1
  j = y-1
  loop do
    
    break if i < 0
    break if j < 0
    
    return false if ans[i][j] == 'Q'

    i -= 1
    j -= 1
  end

  i = x-1
  j = y+1
  loop do
  
    break if i < 0
    break if j >= n
    
    return false if ans[i][j] == 'Q'
    i -= 1
    j += 1
  end  

  true
end

puts solve_n_queens(4).inspect
