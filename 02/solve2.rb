puts ARGF.readlines.count {|line|
	lo,hi,chr,pwd=line.split(/[- :] ?/)
	"#{pwd[lo.to_i-1]}#{pwd[hi.to_i-1]}".count(chr)==1
}