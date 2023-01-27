//
//  Stack.swift
//  DataStructures&Algorithms
//
//  Created by Andres Vazquez on 2023-01-25.
//

import Foundation

struct Stack<T> {
    private var content = [T]()
    var count: Int { content.count }
    
    mutating func push(_ item: T) {
        content.append(item)
    }
    
    mutating func pop() -> T? {
        content.popLast()
    }
    
    func peek() -> T? {
        content.last
    }
    
    func isEmpty() -> Bool {
        content.count < 1
    }
    
    func toArray() -> [T] {
        content
    }
}


extension Stack<Int> {
    private static func reverseString(_ input: String) {
        var stack = Stack<String>()
        var output = ""
        
        for letter in input {
            stack.push("\(letter)")
        }
        
        while !stack.isEmpty() {
            output += stack.pop() ?? ""
        }
        
        print(input)
        print(output)
    }
    
    private static func isStringBalanced(_ input: String) -> Bool {
        var stack = Stack<Character>()
        let leftBrackets: [Character] = ["(", "{", "[", "<"]
        let rightBrackets: [Character] = [")", "}", "]", ">"]
        
        for character in input {
            if leftBrackets.contains(character) {
                stack.push(character)
            } else if rightBrackets.contains(character) {
                guard let openingChar = stack.pop() else { return false }
                
                let leftIndex = leftBrackets.firstIndex(of: openingChar)
                let rightIndex = rightBrackets.firstIndex(of: character)
                
                if leftIndex != rightIndex {
                    return false
                }
            }
        }
        
        return stack.isEmpty()
    }
    
    static func test() {
        reverseString("abcd")
        print("(([1] + <2>))", isStringBalanced("(([1] + <2>))"))
        print(")(([1] + <2>)", isStringBalanced(")(([1] + <2>)"))
    }
}
