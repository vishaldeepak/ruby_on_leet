def merge(intervals)
  intervals = intervals.sort_by {|x| x[0]}

  first = intervals.first[0]
  second = intervals.first[1]
  assign_location = 0
  intervals.each_with_index do |interval, index|
    if index == 0
      first = interval[0]
      second = interval[1]
    else
      new_first = interval[0]
      if new_first.between?(first, second)
        second = [interval[1],second].max
        intervals[assign_location] = [first, second]
      else
        assign_location += 1
        intervals[assign_location] = [new_first, interval[1]]
        first = new_first
        second = interval[1]
      end
    end
  end
  intervals.first(assign_location+1)
end

puts merge([[2,3],[2,2],[3,3],[1,3],[5,7],[2,2],[4,6]]).inspect