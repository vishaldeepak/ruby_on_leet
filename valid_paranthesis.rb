# @param {String} s
# @return {Boolean}
def is_valid(s)
  arr = [] 
  
  len = s.size - 1
   (0..len).each do |index| 
     val = s[index]

     if val == "}" || val == "]" || val == ")"      
       return false if arr.size == 0

       popped = arr.pop
       if val == "}" && popped != "{"
         return false
       elsif val == "]" && popped != "["
         return false
       elsif val == ")" && popped != "("
         return false
       end
     else
       arr.push(s[index])
     end
   end

   return false unless arr.size == 0 
  true
end