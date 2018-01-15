//  August Carow
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        //count
        if args[args.count - 1] == "count" {
            return args.count - 1;
        }
        //average
        else if args[args.count - 1] == "avg" {
            var result = 0;
            for i in args {
                if i != "avg" {
                    result += Int(i)!
                }
            }
            if args.count - 1 >= 1 {
                return result / (args.count - 1)
            }
            else {
                return 0
            }
        }
        //factorial
        else if args[args.count - 1] == "fact" {
            var product = 1
            if args[0] == "fact" {
                return 0
            }
            else if args[0] == "1" || args[0] == "0" {
                return product
            } else {
                let num:Int? = Int(args[0])
                for i in 1...num! {
                    product = product * i
                }
                return product
            }
        }
        //simple operations
        else {
            let firstNum:Int? = Int(args[0])
            let op:String = args[1]
            let secondNum:Int? = Int(args[2])
        
            if op == "+" {
                return firstNum! + secondNum!
            } else if op == "-" {
                return firstNum! - secondNum!
            } else if op == "/" {
                return firstNum! / secondNum!
            } else if op == "*" {
                return firstNum! * secondNum!
            } else if op == "%" {
                return firstNum! - ((firstNum! / secondNum! ) * secondNum!);
            }
        }
        //any other case
        return -1
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

