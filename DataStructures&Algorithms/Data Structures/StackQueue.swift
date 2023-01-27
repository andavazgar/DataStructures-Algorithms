//
//  StackQueue.swift
//  DataStructures&Algorithms
//
//  Created by Andres Vazquez on 2023-01-26.
//

import Foundation

struct StackQueue<T>: CustomStringConvertible {
    private var inputStack = Stack<T>()
    private var outputStack = Stack<T>()
    var description: String {
        return "\(outputStack.toArray() + inputStack.toArray())"
    }
    
    mutating func enqueue(_ item: T) {
        inputStack.push(item)
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty() else { return nil }
        
        prepareOutputStack()
        return outputStack.pop()
    }
    
    mutating func peek() -> T? {
        guard !isEmpty() else { return nil }
        
        prepareOutputStack()
        return outputStack.peek()
    }
    
    func isEmpty() -> Bool {
        outputStack.isEmpty() || inputStack.isEmpty()
    }
    
    private mutating func prepareOutputStack() {
        if outputStack.isEmpty() {
            while !inputStack.isEmpty() {
                outputStack.push(inputStack.pop()!)
            }
        }
    }
}


extension StackQueue<Int> {
    static func test() {
        var queue = StackQueue()
        queue.enqueue(10)
        queue.enqueue(20)
        queue.enqueue(30)
        queue.enqueue(40)
        
        print(queue)
        print(queue.dequeue())
        print(queue.dequeue())
        print(queue)
        
        queue.enqueue(50)
        queue.enqueue(60)
        queue.enqueue(70)
        queue.enqueue(80)
        
        print(queue)
    }
}

