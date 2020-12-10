o={}
ARGF.map{|x|o[x.to_i]=1}
puts o.keys.each.select{|i|o[2020-i]}.map{|i|i*(2020-i)}