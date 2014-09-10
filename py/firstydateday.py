#Counting Sundays
# if a year is a leap year there are 366 days
#   so the next day of date is 366 % 7 == 2
# if a year is not a leap year there are 365 days
#   so the next day of date is 365 % 7 == 1
# Hence it cycles forward 1 or 2 depending

def isLeapYear(year):
	if year % 4 == 0 and year % 100 != 0:
		return True
	elif year % 400 == 0:
		return True
	return False

print(isLeapYear(2000))
print(isLeapYear(2400))
print(isLeapYear(1800))
print(isLeapYear(1900))
print(isLeapYear(2100))
print(isLeapYear(2200))
print(isLeapYear(2300))
print(isLeapYear(2500))

days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
months = [31,28,31,30,31,30,31,31,30,31,30,31,29]

def boolToInt(x):
	if x == False:
		return 0
	return 1

def getSundays():
	count = 1
	acc = 1
	for i in range(1900, 1999):
		for j in range(12):
			if acc == 0:
				count += 1
			med = months[j] % 7
			if isLeapYear(i):
				med = months[-1] % 7
			acc += med
			acc %= 7
	return count

def leapyears():
	for i in range(1900, 2000):
		if isLeapYear(i):
			print(i)

leapyears()


print(getSundays())