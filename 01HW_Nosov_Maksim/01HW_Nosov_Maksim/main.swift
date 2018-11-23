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

func isDividedByThree(_ num: Int) -> Bool {
    if num % 3 == 0 { return true }
    else { return false }
}

for i in 0...numberArray.count - 1 {
    if isDividedByThree(numberArray[i]) {
        print("\(numberArray[i]) делится на 3 без остатка")
    } else {
        print("\(numberArray[i]) не делится на 3 без остатка")
    }
}

// 3. Создать возрастающий массив из 100 чисел.
print("=== Task 03 ===")

var newArray = [Int]()

for i in 0..<100 {
    newArray.append(i)
}

print("Элементы массива newArray: \(newArray)")

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("=== Task 04 ===")

newArray.indices.reversed().forEach {
    if ( checkEven($0) || !isDividedByThree($0) ) { newArray.remove(at: $0) }
}


print("Нечетные и делящиеся на 3 элементы массива newArray: \(newArray)")
