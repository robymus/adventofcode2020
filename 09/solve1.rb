input=ARGF.readlines.map(&:to_i)
pre=input[0..24]
input=input[25..-1]
sums=pre.product(pre).select{|a,b|a!=b}.map{|a,b|a+b}
while sums.include? input[0] do
	pre=pre[1..24]+[input.shift]
	sums=pre.product(pre).select{|a,b|a!=b}.map{|a,b|a+b}
end
p input[0]