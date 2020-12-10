o={}
ARGF.map{|x|o[x.to_i]=1}
n=o.keys
puts n.product(n).select{|a,b|a!=b&&o[2020-a-b]}.map{|a,b|a*b*(2020-a-b)}