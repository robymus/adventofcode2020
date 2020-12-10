data=ARGF.read.split("\n\n")
req=%w(byr iyr eyr hgt hcl ecl pid)
p data.count{|raw|
	d = raw.split.map{|x|x.split(?:)}.to_h
	/^\d{4}$/ === d['byr'] && d['byr'] >= '1920' && d['byr'] <= '2002' &&
	/^\d{4}$/ === d['iyr'] && d['iyr'] >= '2010' && d['iyr'] <= '2020' &&
	/^\d{4}$/ === d['eyr'] && d['eyr'] >= '2020' && d['eyr'] <= '2030' &&
	( # height
		(/^\d+cm$/ === d['hgt'] && d['hgt'].to_i >= 150 && d['hgt'].to_i <=193) ||
		(/^\d+in$/ === d['hgt'] && d['hgt'].to_i >= 59 && d['hgt'].to_i <=76)
	) &&
	/^#[0-9a-f]{6}$/ === d['hcl'] &&
	d['ecl'] && %w(amb blu brn gry grn hzl oth).include?(d['ecl']) && 
	/^\d{9}$/ === d['pid']
}