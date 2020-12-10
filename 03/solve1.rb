m=ARGF.map(&:chomp)
p m.each_with_index.count{|line,i|line[(i*3)%line.size]==?#}