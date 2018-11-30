//
//  main.swift
//  04HW_Nosov_Maksim
//
//  Created by Maksim Nosov on 30/11/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import Foundation

/*
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль. */

class Car {
    
    enum Color {
        case red, blue, white, black, green
    }
    
    var brand: String
    var color: Color
    var capacityFuelTank: Int
    
    static var countCar: Int = 0
    
    init(brand: String, color: Color, capacityFuelTank: Int ) {
        self.brand = brand
        self.color = color
        self.capacityFuelTank = capacityFuelTank
        Car.countCar += 1
    }
    
    func Honk() {
        print("Звучит сигнал объекта Car")
    }
    
}

