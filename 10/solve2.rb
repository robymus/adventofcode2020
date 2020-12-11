adapters=ARGF.map(&:to_i).sort
cnt=[0,0,1] # cheating: index -2, -1, 0 :) - reach 0 in 1 way
dest=adapters[-1]+3
adapters << dest
joltage=1
while joltage <= dest do
	if adapters.include? joltage then
		cnt << cnt[-3]+cnt[-2]+cnt[-1] 
	else
		cnt << 0
	end
	joltage += 1
end
puts cnt[-1]