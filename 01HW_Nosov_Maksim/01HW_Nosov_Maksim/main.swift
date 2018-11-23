//
//  main.swift
//  01HW_Nosov_Maksim
//
//  Created by Maksim Nosov on 23/11/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.

func checkEven(_ num: Int) -> Bool {
    if num % 2 == 0 {
        return true
    } else {
        return false
    }
}

let numberArray = [3, 5, 1, 0, 7, 10, 2]

for i in 0...numberArray.count - 1 {
    if checkEven(numberArray[i]) { print ("Число \(numberArray[i]) - четное")}
    else { print ("Число \(numberArray[i]) - нечетное")}
}

