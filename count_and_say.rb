require 'debug'
# @param {Integer} n
# @return {String}
def count_and_say(n)
  cur_res = "1"
  
  (2..n).each do |itr|
    cur_res = rle(cur_res)

  end
  cur_res
end

def rle(str)
  res = []
  container = [str[0]]
  (1..str.length-1).each do |index|
    char = str[index]

    if container.first != char
      res.push("#{container.size}#{container.first}")      
      container=[]
    end

    container.push(char)
  end

  res.push("#{container.size}#{container.first}") unless container.empty?
  res.join
end
