prog = ARGF.map(&:split).map{|a,b|[a, b.to_i]}
acc = 0
ip = 0
visited = {}
while !visited[ip] do 
	visited[ip] = true
	op,arg = prog[ip]
	case op
	when 'acc'
		acc += arg
		ip += 1
	when 'nop'
		ip += 1
	when 'jmp'
		ip += arg
	else
		puts "unknown op: #{op}"
	end
end
p acc