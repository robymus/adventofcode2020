seats=ARGF.map{|line|line.tr('FBLR','0101').to_i(2)}
s=seats.map{|i|[i,0]}.to_h # s[seatid] = 1
puts (1...seats.max).select{|i|!s[i]&&s[i-1]&&s[i+1]}