def count(rules, color)
	return 1 unless rules[color]
	return rules[color].sum{|cnt, col|cnt*count(rules, col)}+1
end

rules = {}
ARGF.each {|line|
	outside,right = line.chomp.split(' bags contain ')
	next if /^no/ === right
	rules[outside] = []
	right.split(', ').each do |inside|
		cnt, color = inside.sub(/ bags?\.?$/,'').split(' ', 2)
		rules[outside] << [cnt.to_i, color]
	end
}

p count(rules, "shiny gold")-1 # do not count itself