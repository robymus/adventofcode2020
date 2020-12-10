def tree(m, slope)
	m.each_with_index.count{|line,i|line[(i*slope)%line.size]==?#}
end
m=ARGF.map(&:chomp)
# right 1,3,5,7, down 1 * down 2 right 1
p [1,3,5,7].map{|slope|tree(m,slope)}.inject(:*) * tree(m.each_slice(2).map(&:first),1)