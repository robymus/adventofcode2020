input=ARGF.readlines.map(&:to_i)

s=e=0
res=26134589
sum=input[0]
while sum != res do
	e += 1
	exit 2 unless input[e]
	sum += input[e]
	while sum > res do
		sum -= input[s]
		s += 1
	end	
end

p input[s..e].min+input[s..e].max