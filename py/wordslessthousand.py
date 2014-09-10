words = [
	'thousand',
	'hundred',
	'and',
	'ninety',
	'eighty',
	'seventy',
	'sixty',
	'fifty',
	'forty',
	'thirty',
	'twenty',
	'teen',
	'ten',
	'nine',
	'eight',
	'seven',
	'six',
	'five',
	'four',
	'three',
	'two',
	'one',
	'zero',
	'nineteen',
	'eighteen',
	'seventeen',
	'sixteen',
	'fifteen',
	'fourteen',
	'thirteen',
	'twelve',
	'eleven'
]

tenToWord = {
	'9' : 'ninety',
	'8' : 'eighty',
	'7' : 'seventy',
	'6' : 'sixty',
	'5' : 'fifty',
	'4' : 'forty',
	'3' : 'thirty',
	'2' : 'twenty',
	'0' : 'zero'
}

digiToWord = {
	'9' : 'nine',
	'8' : 'eight',
	'7' : 'seven',
	'6' : 'six',
	'5' : 'five',
	'4' : 'four',
	'3' : 'three',
	'2' : 'two',
	'1' : 'one',
	'0' : 'zero'
}

teenToWord = {
	'9' : 'nineteen',
	'8' : 'eighteen',
	'7' : 'seventeen',
	'6' : 'sixteen',
	'5' : 'fifteen',
	'4' : 'fourteen',
	'3' : 'thirteen',
	'2' : 'twelve',
	'1' : 'eleven',
	'0' : 'zero'
}

def expandToMap(lz, f):
	acc = {}
	for i in lz:
		if i == 'zero':
			acc[i] = 0
		else:
			acc[i] = f(i)
	return acc

def intToStr(intg, wmap):
	intg = str(intg)
	if len(intg) == 0:
		return 0
	if len(intg) == 4:
		return len('onethousand')
	elif len(intg) == 3:
		if intg[2] == '0' and intg[1] == '0':
			return wmap[digiToWord[intg[0]]] + len('hundred')
		else:
			return wmap[digiToWord[intg[0]]] + len('hundredand') + intToStr(intg[1:], wmap)
	elif len(intg) == 2:
		if intg[0] == '1':
			if intg[1] == '0':
				return len('ten')
			else:
				return wmap[teenToWord[intg[1]]]
		else:
			return wmap[tenToWord[intg[0]]] + intToStr(intg[1:], wmap)
	else:
		return wmap[digiToWord[intg[0]]] + intToStr(intg[1:], wmap)

print(intToStr(342, expandToMap(words, len)))
print(intToStr(115, expandToMap(words, len)))
print(intToStr(1000, expandToMap(words, len)))
print(intToStr(100, expandToMap(words, len)))

def getAnswerUnder(intg):
	wMap = expandToMap(words, len)
	acc = 0
	for i in range(1, intg + 1):
		if i > 1000:
			break
		rez = intToStr(i, wMap)
		print(str(i) + " : " + str(rez))
		acc += rez
	return acc

print(getAnswerUnder(1000))