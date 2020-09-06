import Cocoa

var dic = ["a":"som"]

var interestingNumbers :[String:[Int]] = ["primes": [2, 3, 5, 7, 11, 13, 17],
"triangular": [1, 3, 6, 10, 15, 21, 28],
"hexagonal": [1, 6, 15, 28, 45, 66, 91]]

print(interestingNumbers[0][1])

for ea in 0...interestingNumbers.count{
    print(interestingNumbers[ea])
}
print(interestingNumbers.count)


