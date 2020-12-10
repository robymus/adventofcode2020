data=ARGF.read.split("\n\n")
p data.sum{|raw|
	raw.scan(/[a-z]/).uniq.size
}
