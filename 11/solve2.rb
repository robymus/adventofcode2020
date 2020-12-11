m = ARGF.map{|x|?L+x.chomp+?L}
w = m[0].size
h = m.size+2
m = [?L*w] + m + [?L*w]
# m: map padded with floors around

def sim(m, w, h)
	o = m.map{|x|x.clone}
	(1..w-2).each do |x|
		(1..h-2).each do |y|
			next if m[y][x] == ?.
			occupied=[-1,0,1].product([-1,0,1]).count{|dx,dy|
				if dx != 0 || dy != 0 then
					px=x+dx
					py=y+dy
					px,py=px+dx,py+dy until 'L#'[m[py][px]]
					m[py][px] == ?#
				else
					false
				end
			}
			o[y][x] = ?# if m[y][x] == ?L && occupied == 0
			o[y][x] = ?L if m[y][x] == ?# && occupied >= 5
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
