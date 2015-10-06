//: Playground - noun: a place where people can play

import UIKit

var program = "Fibonacci Series"

var n = 10, first = 0, second = 1
var next = first

for c in 0..<n {
    if c <= 1 {
        next = c
    } else {
        next = first + second
        first = second
        second = next
    }
    
    print("\(c): \(next)")
    
}


func perm(var a: [String], k: Int, n: Int) {
    if k == n {
        print(a)
    } else {
        for i in k..<n {
            let t = a[k]
            a[k] = a[i]
            a[i] = t
            
            perm(a, k: k+1, n: a.count)
        }
    }
}

let arr = ["a"]
perm(arr, k: 1, n: arr.count)

let anotherArr = ["a", "b", "c"]
print(anotherArr.count)
perm(anotherArr, k: 0, n: anotherArr.count)

func pigeonHole(a:[Int]) -> Int {
    var sum = 0
    for i in 0..<a.count {
        sum = sum + a[i]
    }
    return sum
}

let sum = pigeonHole([1, 2, 3, 1])


func insertionSort(var array:[Int]) -> [Int] {
    for i in 0..<array.count {
        var j = i
        while j > 0 && array[j-1] > array[j] {
            let temp = array[j]
            array[j] = array[j-1]
            array[j-1] = temp
            j--
        }
    }
    
    return array
}

let results = insertionSort([1, 3, 2]) //insertionSort([1, 8, 5, 3, 10, 2, 9, 12])


