//: Playground - noun: a place where people can play

import UIKit
import Foundation

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

var intArray = [1, 3, 2, 100, -1, 87, 0, 0, -1]

//intArray = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

// INSERTION SORT

func insertionSort(var array:[Int]) -> [Int] {
    print(array.count)
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

let results = insertionSort(intArray) //insertionSort([1, 8, 5, 3, 10, 2, 9, 12])

//Test if two ranges overlap

func rangesOverlap(range1: NSRange, range2: NSRange) -> Bool {
    if range1.location <= (range2.location + range2.length) && range2.location <= (range1.location + range1.length) {
        return true
    }
    return false
}

let range1 = NSMakeRange(7, 10)
let range2 = NSMakeRange(7, 4)

var doTheyOverlap = rangesOverlap(range2, range2: range1)

let rangeA = NSMakeRange(0, 4)
let rangeB = NSMakeRange(6, 6)

doTheyOverlap = rangesOverlap(rangeA, range2: rangeB)

print(doTheyOverlap)

func swapTwoValues<T>(inout a: T, inout b: T) {
    let tempA = a
    a = b
    b = tempA
}


// SELECTION SORT

func selectionSort<T: Comparable>(inout array:[T]) {
    print(array.count)
    for i in 0..<array.count - 1 {
        var min = i
        
        for j in i + 1..<array.count {
            if array[j] < array[min] {
                min = j
            }
        }
        
        if min != i {
            swap(&array[i], &array[min])
        }
    }
}

var arrayOfInts = [1, 2, 10, -8, 0, 100]

selectionSort(&intArray)

// BINARY SEARCH TREE

public class AVLTree<T: Comparable> {
    var key: T?
    var left: AVLTree?
    var right: AVLTree?
    var height: Int = 0
    
    //Adding a new node
    
    func addNote(key: T) {
        if self.key == nil {
            self.key = key
            return
        }
        
        if key < self.key {
            //Add to the left
            
            if left != nil {
                left?.addNote(key)
            } else {
                let leftChild = AVLTree()
                leftChild.key = key
                left = leftChild
            }
        }
        
        if key > self.key {
            //Add to the right
            
            if right != nil {
                right?.addNote(key)
            } else {
                let rightChild = AVLTree()
                rightChild.key = key
                right = rightChild
            }
        }
    }
    
    func find(key: T, tree: AVLTree) -> Bool {
        if key == tree.key {
            return true
        }
        
        if key < tree.key {
            find(key, tree: tree.left!)
        } else if key > tree.key {
            find(key, tree: tree.right!)
        }
        
        return false
    }
    
    func getNodeHeight(aNode: AVLTree!) -> Int {
        if aNode == nil {
            return -1
        } else {
            return aNode.height
        }
    }
    
    func setNodeHeight() -> Bool {
        if self.key ==  nil {
            print("no key provided")
            return false
        }
        
        var nodeHeight: Int = 0
        
        nodeHeight = max(getNodeHeight(self.left), getNodeHeight(self.right)) + 1
        
        self.height = nodeHeight
        
        return true
    }
}

let numberList: Array<Int> = [2, 3, 4, 1, 8, 5, 19, 10, -1]

var root = AVLTree<Int>()
for number in numberList {
    root.addNote(number)
}

print(root.key)

root.find(4, tree: root)

// TRIE

public class TrieNode {
    var key: String!
    var children: Array<TrieNode>
    var isFinal: Bool
    var level: Int
    
    init() {
        self.children = Array<TrieNode>()
        self.isFinal = false
        self.level = 0
    }
    
}

public class Trie {
    private var root: TrieNode!
    
    init() {
        root = TrieNode()
    }

    func addWord(keyword: String) {
        
        if keyword.isEmpty {
            return
        }
        
        var current: TrieNode = root
        
        if current.key != nil {
            print(current.key)
        }
        
        while keyword.characters.count != current.level {
            
            var childToUse: TrieNode!
            let searchKey: String = (keyword as NSString).substringToIndex(current.level + 1)
            
            print(searchKey)
            
            for child in current.children {
                print(child.key)
                if child.key == searchKey {
                    childToUse = child
                    break
                }
            }
            
            if childToUse == nil {
                childToUse = TrieNode()
                childToUse.key = searchKey
                childToUse.level = current.level + 1
                current.children.append(childToUse)
            }
            
            current = childToUse
            
            print(current.key)
        }
        
        if keyword.characters.count == current.level {
            current.isFinal = true
            print("End of word reached")
            return
        }
    }
    
    func findWord(keyword: String) -> Array<String>? {
        
        if keyword.characters.count == 0 {
            return nil
        }
        
        var current = root
        var wordList = Array<String>()
        
        while keyword.characters.count != current.level {
            
            var childToUse: TrieNode!
            let searchKey = (keyword as NSString).substringToIndex(current.level + 1)
            
            print("Looking for prefix:\(searchKey)")
            
            for child in current.children {
                
                if child.key == searchKey {
                    childToUse = child
                    current = childToUse
                    break
                }
            }
            
            if childToUse == nil {
                return nil
            }
        }
        
        if (current.key == keyword) && current.isFinal {
            wordList.append(current.key)
        }
        
        for child in current.children {
            if child.isFinal {
                wordList.append(child.key)
            }
        }
        
        return wordList
    }

}

let testTrie = Trie()

//add words to data structure
testTrie.addWord("Ball")
testTrie.addWord("Balls")
testTrie.addWord("Ballard")
testTrie.addWord("Bat")
testTrie.addWord("Bar")
//
print(testTrie.root.children.count)

let foundWords = testTrie.findWord("Bat")

//QUEUE

class QNode<T> {
    var key: T?
    var next: QNode?
}


public class Queue<T> {
    private var top: QNode<T>! = QNode<T>()
    
    
    func enque(key: T) {
        
        if top == nil {
            top = QNode<T>()
        }
        
        if top.key == nil {
            top.key = key
            return
        }
        
        let childToUse: QNode<T> = QNode<T>()
        var current: QNode = top
        
        while current.next != nil {
            current = current.next!
        }
        
        childToUse.key = key
        current.next = childToUse
        
    }
    
    func dequeu() -> T? {
        
        let topItem: T? = self.top?.key
        
        if topItem == nil {
            return nil
        }
        
        let queItem: T? = top.key!
        
        if let nextItem = top.next {
            top = nextItem
        } else {
            top = nil
        }
        
        return queItem
    }
}


let queue = Queue<Int>()

for number in numberList {
    print(number)
    queue.enque(number)
}

for number in numberList {
    let a = queue.dequeu()
    print(a)
}


//GRAPHS

//: Refer to LearningAlgos.xcodeproj

