rev_rules = {}
ARGF.each {|line|
	outside,right = line.chomp.split(' bags contain ')
	next if /^no/ === right
	right.split(', ').each do |inside|
		cnt, color = inside.sub(/ bags?\.?$/,'').split(' ', 2)
		rev_rules[color] = (rev_rules[color]||[]) + [outside]
	end
}
start="shiny gold"
open=[start]
closed=[]
while open.size > 0 do
	color = open[0]
	open -= [color]
	closed += [color]
	rev_rules[color].each do |dest|
		open << dest unless open.include?(dest) || closed.include?(dest)
	end if rev_rules[color]
end
p (closed-[start]).size