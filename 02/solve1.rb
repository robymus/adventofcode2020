puts ARGF.readlines.count {|line|
	lo,hi,chr,pwd=line.split(/[- :] ?/)
	(lo.to_i..hi.to_i) === pwd.count(chr)
}