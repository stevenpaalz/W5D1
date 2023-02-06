# class Integer
#   # Integer#hash already implemented for you
# end

# class Array
#   def hash
#     sum = 0
#     self.each_with_index do |ele, idx|
#       sum += (ele ^ idx).to_s(2).to_i * (10*idx)
#     end
#     sum.hash
#   end
# end

# class String
#   def hash
#     nums = []
#     self.split("").each {|char| nums += char.bytes}
#     nums.hash
#   end
# end

# class Hash
#   # This returns 0 because rspec will break if it returns nil
#   # Make sure to implement an actual Hash#hash method
#   def hash
#     sum = 0
#     self.each do |k, v|
#       key_bytes = k.to_s.bytes
#       value_bytes = v.to_s.bytes
#       sum += (key_bytes[0] ^ value_bytes[0]).to_s(2).to_i.hash
#     end
#     sum
#     # 0
#   end
# end
