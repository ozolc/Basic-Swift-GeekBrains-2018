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

//5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
//Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
print("=== Task 05 ===")

func fibo(_ n: Int) -> [Decimal] {
    var fiboArray = [Decimal]()
    var a: Decimal = 0
    var b: Decimal = 1

    for _ in 0..<n {
        a += b
        fiboArray.append(a)
        b = a - b
    }
    return fiboArray
}

print("Массив с числами Фибоначчи = \(fibo(100))")


//6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
//
//a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
//b. Пусть переменная p изначально равна двум — первому простому числу.
//c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
//d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
//e. Повторять шаги c и d, пока возможно.
print("=== Task 05 ===")

func Prime(num: Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
func PrimeArray () -> [Int] {
    var results = [Int]()
    var i = 2
    while results.count < 100 {
        if Prime(num: i) {
            results.append(i)
        }
        i += 1
    }
    
    return results
}
print("Все целые числа = \(PrimeArray())")
