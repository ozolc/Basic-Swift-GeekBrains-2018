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
    
    enum Color: String {
        case red = "red", blue = "blue", white = "white", black = "black", green = "green"
    }
    
    enum Transmission {
        case auto, manual
    }
    
    var brand: String
    var color: Color
    var transmission: Transmission
    var capacityFuelTank: Int
    
    static var countCar: Int = 0
    
    init(brand: String, color: Color, transmission: Transmission, capacityFuelTank: Int) {
        self.brand = brand
        self.color = color
        self.capacityFuelTank = capacityFuelTank
        self.transmission = transmission
        
        Car.countCar += 1
    }
    
    private func Honk() {   // Пустой метод действия родительского класса
        print("Звучит сигнал объекта Car")
    }
    
    private func getInfo() {
        let text = """
        Объект \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank).
        """
        print(text)
    }
    
}

class TrunkCar: Car {
    
    var isHasTrailer: Bool
    var countOfWheels: Int
    
    init(brand: String, color: Car.Color, transmission: Car.Transmission, capacityFuelTank: Int, isHasTrailer: Bool, countOfWheels: Int) {
        self.isHasTrailer = isHasTrailer
        self.countOfWheels = countOfWheels
        
        // Имплементация родительского инициализатора
        super.init(brand: brand, color: color, transmission: transmission, capacityFuelTank: capacityFuelTank)
    }
}




