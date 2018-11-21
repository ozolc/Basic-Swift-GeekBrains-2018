//
//  main.swift
//  01L_NosovMaksim
//
//  Created by NosovML on 20/11/2018.
//  Copyright © 2018 NosovML. All rights reserved.
//

import Foundation

//MARK: - Task 1
//Задание: Решить квадратное уравнение

print("Задание №1")
let a, b, c, x: Double
a = 2
b = 6
c = 4
if ((b * b - 4 * a * c) >= 0) //Если дискриминант больше или равен 0
{
    let x1 = (-1 * b + sqrt(b * b - 4*a*c) ) / (2 * a);
    print("Первый корень равен \(x1)")
    let x2 = (-1 * b - sqrt(b * b - 4 * a * c) ) / (2 * a);
    print("Второй корень равен \(x2)")
}
else
{
    print("Дискриминант меньше 0, корни невещественные.")
}


//MARK: - Task 2
//Задание: Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

print("\nЗадание №2")
let catet1: Double = 3
let catet2: Double = 4

print("Площадь прямоугольного треугольника равна: \(0.5 * catet1 * catet2)")

let hypotenuse = sqrt((catet1 * catet1) + (catet2 * catet2))
print("Гипотенуза прямоугольного треугольника равна: \(hypotenuse)")
print("Периметр прямоугольного треугольника равен: \(hypotenuse + catet1 + catet2)")

//MARK: - Task 3
// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

print("\nЗадание №3")
var deposit: Double = 0.0
var interest: Double = 0.0

print("Введите сумму вклада: ")
if let input = readLine() {
    if let dep = Double(input) { deposit = dep }
}

print("Введите годовой процент: ")
if let input = readLine() {
    if let rate = Double(input) { interest = rate }
}

for _ in 1...5 {
    deposit = deposit * (1 + (interest / 100))
}

print("Через 5 лет сумма вашего вклада будет составлять: \(round(100 * deposit) / 100)")
