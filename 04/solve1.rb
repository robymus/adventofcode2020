data=ARGF.read.split("\n\n")
req=%w(byr iyr eyr hgt hcl ecl pid)
p data.count{|raw|
	d = raw.split.map{|x|x.split(?:)}.to_h
	req.all?{|key|d[key]}
}