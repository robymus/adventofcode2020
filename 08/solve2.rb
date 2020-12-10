def run(changethis)
	prgend = @prog.size
	acc = 0
	ip = 0
	visited = {}
	while ip < prgend && !visited[ip] do 
		visited[ip] = true
		op,arg = @prog[ip]
		if ip == changethis then
			op = (op == 'nop') ? 'jmp' : 'nop'
		end
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
	return [ip<prgend, acc]
end

@prog = ARGF.map(&:split).map{|a,b|[a, b.to_i]}

# bruteforce
@prog.size.times do |ip|
	next if @prog[ip][0]=='acc'
	fails, acc = run(ip)
	if not fails then
		puts acc
		exit 0
	end
end
puts "failure"
exit 1