//
//  PriorityQueue.swift
//  DataStructures&Algorithms
//
//  Created by Andres Vazquez on 2023-01-26.
//

import Foundation

struct PriorityQueue<T: Comparable> {
    private var content = Array<T>()
    
    mutating func enqueue(_ item: T) {
        var index = 0
        
        if !isEmpty() {
            // Find insertion index
            for i in stride(from: content.count - 1, through: 0, by: -1) {
                if content[i] < item {
                    index = i + 1
                    break
                }
            }
        }
        
        content.insert(item, at: index)
    }
    
    func isEmpty() -> Bool {
        content.count == 0
    }
}


extension PriorityQueue<Int> {
    static func test() {
        var queue = PriorityQueue()
        queue.enqueue(1)
        queue.enqueue(3)
        queue.enqueue(5)
        queue.enqueue(2)
        
        print(queue)
    }
}
