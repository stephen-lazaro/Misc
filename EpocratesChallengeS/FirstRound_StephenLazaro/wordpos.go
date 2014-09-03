package main

import (
	"fmt"
	"os"
)

// This could be more graceful than having two separate functions that
// essentially do the same thing, but if it ain't broke...
// Gives a slice of items earlier in the alphabet than the given
// rune, we use it much like a python list comprehension.
func lessList(pivot rune, word []rune) []rune {
	if len(word) == 0 {
		return []rune{}
	}
	result := make([]rune, 0)
	for _,charact := range word {
		if charact < pivot && !in(charact, result) {
			result = append(result, charact)
		}
	}
	return result
}

// Gives a slice of items later in the alphabet than the given
// rune, we use it much like a python list comprehension.
func moreList(pivot rune, word []rune) []rune {
	if len(word) == 0 {
		return []rune{}
	}
	result := make([]rune, 0)
	for _,charact := range word {
		if charact > pivot && !in(charact, result) {
			result = append(result, charact)
		}
	}
	return result
}

// Takes a string and returns a slice of runes of
// characters from the word in order.
func strToRune(word string) []rune {
	if len(word) == 0 {
		return []rune{}
	}
	result := make([]rune, len(word))
	for idx, char := range word {
		result[idx] = char
	}
	return result
}

// Simple utility to check that an item is in a list.
// I am not convinced this is the fastest way to do it.
func in(item rune, lz []rune) bool {
	if len(lz) == 0 {
		return false
	}
	for _,thing := range lz {
		if item == thing {
			return true
		}
	}
	return false
}

// Constructs a list of items that are repeated, and a map that 
// when given a letter from the word gives the number of occurrences.
func getRepetitions(word []rune) (repMap map[rune]int, repList []rune) {
	repMap = make(map[rune]int)
	repList = make([]rune, 0)
	for _,charact := range word {
		_,err := repMap[charact]
		if err != false {
			repMap[charact] += 1
			if !in(charact, repList) {
				repList = append(repList, charact)
			}
		} else {
			repMap[charact] = 1
		}
	}
	return
}

// A simple factorial.
func factorial(n int) uint64 {
	if n == 0 {
		return 1
	} else {
		return uint64(n)*factorial(n - 1)
	}
}

// Returns a list of the distinct letters in the word as a slice of runes.
func noReps(word []rune) []rune {
	acc := make([]rune, 0)
	for _,charact := range word {
		if !in(charact, acc) {
			acc = append(acc, charact)
		}
	}
	return quicksort(acc)
}

// Sorts a list of runes using the quicksort algorithm
// Returns a new slice of runes, sorted.
func quicksort(toSort []rune) []rune {
	if len(toSort) == 0 {
		return []rune{}
	}
	less := quicksort(lessList(toSort[0], toSort))
	pivot := toSort[0]
	more := quicksort(moreList(toSort[0], toSort))
	result := append(less, pivot)
	result = append(result, more...)
	return result
}

// 
func count(chanOut chan uint64, inputWord string) {
	word := strToRune(inputWord)
	uniqTerms := noReps(word)
	repsMap, repsList := getRepetitions(word)
	lessThanHead := lessList(word[0], uniqTerms)
	var fullPrevTree uint64
	fullPrevTree = factorial(len(word) - 1)
	var acc uint64
	acc = 0
	for _,character := range lessThanHead {
		var med uint64
		med = fullPrevTree
		for _,repetition := range repsList {
			if character != repetition {
				med = med / factorial(repsMap[repetition])
			} else {
				med = med / factorial(repsMap[character] - 1)
			}
		}
		acc += med
	}
	chanOut <- acc
}


// Command line interfacing, grabs an command line arguments and
// checks we have been given one.
func getArgument() string {
	if len(os.Args) < 2 {
		fmt.Println("We need an argument!")
		return "-1"
	} else {
		return os.Args[1]
	}
}

// Spawns a separate thread for each term in the sequence
// and then collects the various returns, printing the
// result to the command line.
func main() {
	word := getArgument()
	if word == "-1" {
		os.Exit(-1)
	}
	chanIn := make(chan uint64, 50)
	for idx,_ := range word {
		go count(chanIn, word[idx:])
	}
	var acc uint64
	acc = 1
	for i := 0; i < len(word); i++ {
		acc += <- chanIn
	}
	fmt.Println(acc)
}