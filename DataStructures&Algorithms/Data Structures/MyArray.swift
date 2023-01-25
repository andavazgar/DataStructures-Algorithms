//
//  MyArray.swift
//  DataStructures&Algorithms
//
//  Created by Andres Vazquez on 2023-01-24.
//

import Foundation

struct MyArray<T> {
    private var content = Array<T>()
    private var count = 0
    
    init(capacity: Int = 5) {
        content.reserveCapacity(capacity)
    }
    
    mutating func insert(_ newElement: T) {
        if content.count == count {
            var newContent = Array<T>()
            newContent.reserveCapacity(count * 2)
            newContent.append(contentsOf: content)
            content = newContent
        }
        
        content.append(newElement)
        count += 1
    }
    
    mutating func removeAt(_ index: Int) {
        if index < 0 || index >= count {
            // Not a valid index
            return
        }
        
        for i in index..<count - 1 {
            content[i] = content[i + 1]
        }
        
        content.removeLast()
        count -= 1
    }
    
    func printArray() {
        print("[" + content.map { "\($0)" }.joined(separator: ", ") + "]")
    }
}


extension MyArray<Int> {
    
    /// Expected Output:
    /// [10, 20, 30, 40]
    /// [10, 30, 40]
    static func test() {
        var arr = MyArray()
        arr.insert(10)
        arr.insert(20)
        arr.insert(30)
        arr.insert(40)

        arr.printArray()
        arr.removeAt(1)
        arr.printArray()
    }
}
