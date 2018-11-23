//
//  main.swift
//  01HW_Nosov_Maksim
//
//  Created by Maksim Nosov on 23/11/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import Foundation

let numberArray = [3, 5, 1, 0, 7, 10, 2]

// 1. Написать функцию, которая определяет, четное число или нет.
print("=== Task 01 ===")

func checkEven(_ num: Int) -> Bool {
    if num % 2 == 0 {
        return true
    } else {
        return false
    }
}

for i in 0...numberArray.count - 1 {
    if checkEven(numberArray[i]) { print ("Число \(numberArray[i]) - четное")}
    else { print ("Число \(numberArray[i]) - нечетное")}
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
print("=== Task 02 ===")

func isDividedByThree(_ num: Int) {
    if num % 3 == 0 {
        print("\(num) делится на 3 без остатка")
    } else {
        print("\(num) не делится на 3 без остатка")
    }
}

for i in 0...numberArray.count - 1 { isDividedByThree(numberArray[i]) }

// 3. Создать возрастающий массив из 100 чисел.
print("=== Task 03 ===")

var newArray = [Int]()

for i in 0..<100 {
    newArray.append(i)
}

print("Элементы массива: \(newArray)")
