adapters=ARGF.map(&:to_i).sort
joltage=0
jumps=[0,0,0,1] # the final jump is always a 3
adapters.each do |a|
	jumps[a-joltage] += 1
	joltage = a
end
p jumps
p jumps[1]*jumps[3]
