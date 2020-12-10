data=ARGF.read.split("\n\n")
p data.sum{|raw|
	answers=raw.split
	(?a..?z).count{|c|answers.all?{|a|a[c]}}
}
