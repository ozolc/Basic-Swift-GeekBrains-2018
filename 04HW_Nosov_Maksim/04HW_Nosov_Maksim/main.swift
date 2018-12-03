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
    
    func Honk() {   // Пустой метод действия родительского класса
        print("Звучит сигнал реализованный в суперклассе Car\n")
    }
    
    func getInfo() { // Этот метод будет переопределен в поддкалссах
        let text = """
        Объект \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank).
        """
        print(text)
    }
    
    static func countInfo(){
        print("Выпущено автомобилей в количестве \(self.countCar) единиц")
    }
    
}

class TrunkCar: Car {
    
    enum StateOfLoading: String {
        case load = "погрузка", unload = "разгрузка"
    }
    
    var isHasTrailer: Bool
    var countOfWheels: Int
    var loadState: StateOfLoading
    
    init(brand: String, color: Car.Color, transmission: Car.Transmission, capacityFuelTank: Int, isHasTrailer: Bool, countOfWheels: Int, loadState: StateOfLoading) {
        self.isHasTrailer = isHasTrailer
        self.countOfWheels = countOfWheels
        self.loadState = loadState
        
        // Имплементация родительского инициализатора
        super.init(brand: brand, color: color, transmission: transmission, capacityFuelTank: capacityFuelTank)
    }
    
    func getTrailer(trailer: Bool) -> String {
        switch trailer {
        case true:
            return "есть прицеп"
        case false:
            return "без прицепа"
        }
    }
    
    func loadingAction(state: StateOfLoading) -> Void {
        switch state {
        case .load:
            loadState = .load
            print(state.rawValue)
        case .unload:
            loadState = .unload
            print(state.rawValue)
        }
    }
    
    override func getInfo() {
        let text = """
        \n====
        Грузовик \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank)л. и имеет \(countOfWheels) колеса.
        Состояние прицепа - \(getTrailer(trailer: isHasTrailer))
        Находится в состоянии - \(loadState.rawValue)
        ====\n
        """
        print(text)
    }
}


class SportCar: Car {
    
    // Соответствие протоколу RawRepresentable для использования литерального значения в enum с типом Bool (вне задания)
    enum TurboCharging: RawRepresentable {
        case on
        case off
        
        typealias RawValue = Bool
        var rawValue: RawValue {
            return self == .on ? true : false
        }
        init?(rawValue: RawValue) {
            self = rawValue == true ? .on : .off
        }
    }
    
    var isHasSpoiler: Bool
    var isHasPlayerOnBoard: Bool
    var stateOfTurboCharging: TurboCharging
    
    init(brand: String, color: Color, transmission: Transmission, capacityFuelTank: Int, isHasSpoiler: Bool, isHasPlayerOnBoard: Bool, stateOfTurboCharging: TurboCharging) {
        self.isHasSpoiler = isHasSpoiler
        self.isHasPlayerOnBoard = isHasPlayerOnBoard
        self.stateOfTurboCharging = stateOfTurboCharging
        
        // Имплементация родительского инициализатора
        super.init(brand: brand, color: color, transmission: transmission, capacityFuelTank: capacityFuelTank)
    }
    
    func getSpoiler(spoiler: Bool) -> String {
        switch spoiler {
        case true:
            return "На кузове установлен спойлер"
        case false:
            return "На кузове спойлер отсутствует"
        }
    }
    
    func TurboCharging(state: TurboCharging) {
        if state == .on {
            self.stateOfTurboCharging = .on
            print("Турбонаддув активирован")
        } else {
            self.stateOfTurboCharging = .off
            print("Турбонаддув отключен")
        }
    }
    
    func getPlayerOnBoard(player: Bool) -> String {
        switch player {
        case true:
            return "В комплектации установлен медиапроигрыватель"
        case false:
            return "В данной комплектации отсутствует медиапроигрыватель"
        }
    }
    
    override func getInfo() {
        let text = """
        \n====
        Спорткар \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank)л. \(getSpoiler(spoiler: isHasSpoiler)).
        Состояние турбонаддува - \(stateOfTurboCharging)
        \(getPlayerOnBoard(player: isHasPlayerOnBoard))
        ====\n
        """
        print(text)
    }
}

var truck01 = TrunkCar(brand: "MAN", color: .white, transmission: .auto, capacityFuelTank: 800, isHasTrailer: true, countOfWheels: 6, loadState: .unload)

truck01.Honk()
truck01.getInfo()

var sportCar01 = SportCar(brand: "McLaren", color: .red, transmission: .auto, capacityFuelTank: 150, isHasSpoiler: true, isHasPlayerOnBoard: true, stateOfTurboCharging: .on)

sportCar01.getInfo()
sportCar01.Honk()
Car.countInfo()
