//
//  Queue.swift
//  DataStructures&Algorithms
//
//  Created by Andres Vazquez on 2023-01-26.
//

import Foundation

struct Queue<T>: CustomStringConvertible {
    private var content = Array<T>()
    private var front = 0
    private var end = 0
    private var numOfElements = 0
    private let capacity: Int
    var description: String {
        let slice = front <= end ? content[front..<end] : content[front..<capacity] + content[0..<end]
        return "\(slice)"
    }
    
    init(_ array: [T] = [], capacity: Int = 10) {
        self.capacity = capacity
        content.reserveCapacity(capacity)
        
        for item in array {
            enqueue(item)
        }
    }
    
    mutating func enqueue(_ item: T) {
        guard !isFull() else {
            print("Queue is full. Could not enqueue value \"\(item)\". The queue capacity is of \(capacity) elements.")
            return
        }
        
        content.insert(item, at: end)
        
        end = (end + 1) % capacity
        numOfElements += 1
    }
    
    mutating func dequeue() -> T? {
        guard !isEmpty() else {
            print("Queue is empty. Could not dequeue any value.")
            return nil
        }
        
        var item = content[front]
        
        front = (front + 1) % capacity
        numOfElements -= 1
        return item
    }
    
    func peek() -> T? {
        guard !isEmpty() else { return nil }
        return content[front]
    }
    
    func isEmpty() -> Bool {
        numOfElements == 0
    }
    
    func isFull() -> Bool {
        numOfElements == capacity
    }
}


extension Queue<Int> {
    private static func reverse(_ queue: inout Self) {
        // [10, 20, 30, 40]
        // [40, 30, 20, 10]
        var stack = Stack<Int>()
        
        while !queue.isEmpty() {
            stack.push(queue.dequeue()!)
        }
        
        while !stack.isEmpty() {
            queue.enqueue(stack.pop()!)
        }
    }
    
    static func test() {
        var queue = Queue<Int>([10, 20, 30, 40])
        
        print(queue)
        Queue.reverse(&queue)
        print(queue)
    }
}
