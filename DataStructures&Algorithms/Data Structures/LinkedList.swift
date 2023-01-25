//
//  LinkedList.swift
//  DataStructures&Algorithms
//
//  Created by Andres Vazquez on 2023-01-24.
//

import Foundation

class LinkedList<T: Comparable> {
    private class Node: Equatable {
        var value: T
        var next: Node?
        
        init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
        
        static func == (lhs: LinkedList<T>.Node, rhs: LinkedList<T>.Node) -> Bool {
            lhs.value == rhs.value && lhs.next == rhs.next
        }
    }
    
    private var first: Node?
    private var last: Node?
    private var isEmpty: Bool {
        first == nil
    }
    var size = 0
    
    init(item: T? = nil) {
        if let item {
            let node = Node(value: item)
            first = node
            last = node
        }
    }
    
    func addFirst(_ item: T) {
        let node = Node(value: item)
        
        if isEmpty {
            first = node
            last = node
        } else {
            node.next = first
            first = node
        }
        
        size += 1
    }
    
    func addLast(_ item: T) {
        let node = Node(value: item)
        
        if isEmpty {
            first = node
            last = node
        } else {
            last?.next = node
            last = node
        }
        
        size += 1
    }
    
    func indexOf(_ item: T) -> Int? {
        var index = 0
        var nextNode = first
        
        while nextNode != nil {
            if nextNode!.value == item {
                return index
            }
            
            nextNode = nextNode!.next
            index += 1
        }
        
        return nil
    }
    
    func contains(_ item: T) -> Bool {
        indexOf(item) != nil
    }
    
    func removeFirst() {
        if !isEmpty {
            if first == last {
                first = nil
                last = nil
            } else {
                let second = first?.next
                first?.next = nil
                first = second
            }
            
            size -= 1
        }
    }
    
    func removeLast() {
        if !isEmpty {
            if first == last {
                first = nil
                last = nil
            } else {
                let previousNode = getPrevious(last!)
                
                last = previousNode
                previousNode?.next = nil
            }
            
            size -= 1
        }
    }
    
    private func getPrevious(_ node: Node) -> Node? {
        var current = first
        
        while current != nil {
            if current!.next == node {
                return current
            }
            
            current = current!.next
        }
        
        return nil
    }
    
    func toArray() -> [T] {
        var current = first
        var array = [T]()
        array.reserveCapacity(size)
        
        while current != nil {
            array.append(current!.value)
            current = current!.next
        }
        
        return array
    }
    
    func reverse() {
        guard !isEmpty && first != last else { return }
        
        var previousNode = first
        var currentNode = first?.next
        
        while currentNode != nil {
            var nextNode = currentNode!.next
            
            currentNode!.next = previousNode
            
            previousNode = currentNode
            currentNode = nextNode
        }
        
        last = first
        last?.next = nil
        first = previousNode
    }
    
    func getKthFromTheEnd(_ kIndex: Int) -> T? {
        guard kIndex > 0 && kIndex <= size else { return nil }
        
        var pointer1 = first
        var pointer2 = first
        
        for _ in 0..<kIndex - 1 {
            pointer2 = pointer2?.next
        }
        
        while pointer2 != last {
            pointer1 = pointer1?.next
            pointer2 = pointer2?.next
        }
        
        return pointer1?.value
    }
    
    func getKthFromTheEnd2(_ kIndex: Int) -> T? {
        guard kIndex > 0 && kIndex <= size else { return nil }
        
        let numOfLoops = size - kIndex
        var node = first
        
        for _ in 0..<numOfLoops {
            node = node?.next
        }
        
        return node?.value
    }
}


extension LinkedList<Int> {
    
    /// Expected Output:
    /// [10, 20, 30, 40, 50]
    /// 40
    static func test() {
        let list = LinkedList()
        list.addLast(10)
        list.addLast(20)
        list.addLast(30)
        list.addLast(40)
        list.addLast(50)

        print(list.toArray())
        print(list.getKthFromTheEnd(2) ?? "")
    }
}
