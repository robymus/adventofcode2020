m = ARGF.map{|x|?.+x.chomp+?.}
w = m[0].size
h = m.size+2
m = [?.*w] + m + [?.*w]
# m: map padded with floors around

def sim(m, w, h)
	o = m.map{|x|x.clone}
	(1..w-2).each do |x|
		(1..h-2).each do |y|
			next if m[y][x] == ?.
			occupied=[-1,0,1].product([-1,0,1]).count{|dx,dy|(dx!=0||dy!=0) && m[y+dy][x+dx]==?#}
			o[y][x] = ?# if m[y][x] == ?L && occupied == 0
			o[y][x] = ?L if m[y][x] == ?# && occupied >= 4
		end
	end
	return o
end

n = sim(m,w,h)
while n != m do
	m = n
	n = sim(m,w,h)
end

puts m.join.count(?#)
