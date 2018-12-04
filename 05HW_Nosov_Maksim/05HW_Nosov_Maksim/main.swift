//
//  main.swift
//  05HW_Nosov_Maksim
//
//  Created by NosovML on 04/12/2018.
//  Copyright © 2018 NosovML. All rights reserved.
//

import Foundation

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.

enum Color: String {
    case red = "red", blue = "blue", white = "white", black = "black", green = "green"
}

enum ActionWindow {
    case open, close
}

enum ActionEngine {
    case start, stop
}

protocol Car {
    var brand: String { get set }
    var capacityFuelTank: Int { get set }
    var color: Color { get set }
    
    func Honk()
//    func getInfo()
}

extension Car {
    
    func actionWindow(action: ActionWindow) {
        switch action {
        case .open:
            print("Окно открыто")
        case .close:
            print("Окно закрыто")
        }
    }
    
    func actionEngine(action: ActionEngine) {
        switch action {
        case .start:
            print("Двигатель запущен")
        case .stop:
            print("Двигатель выключен")
        }
    }
    
    func Honk() {
        print("Звучит сигнал реализованный в суперклассе Car\n")
    }
}

class TrunkCar: Car {
    
    enum Trailer: String {
        case yes = "прицеп есть", no = "прицеп отстутствует"
    }
    
    var brand: String
    var capacityFuelTank: Int
    var color: Color
    
    // Индивидуальное свойство класса trunkCar
    var isHasTrailer: Trailer
    
    init(brand: String, capacityFuelTank: Int, color: Color, isHasTrailer: Trailer) {
        self.brand = brand
        self.capacityFuelTank = capacityFuelTank
        self.color = color
        self.isHasTrailer = isHasTrailer
    }
    
}

extension TrunkCar: CustomStringConvertible {
        var description : String {
            return "Грузовик \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank). Статус прицепа - \(self.isHasTrailer.rawValue)\n"
    }
}

class SportCar: Car {
    
    enum Spoiler: String {
        case yes = "спойлер есть", no = "спойлер отстутствует"
    }
    
    var brand: String
    var capacityFuelTank: Int
    var color: Color
    
    // Индивидуальное свойство класса sportCar
    var isHasSpoiler: Spoiler
    
    init(brand: String, capacityFuelTank: Int, color: Color, isHasSpoiler: Spoiler) {
        self.brand = brand
        self.capacityFuelTank = capacityFuelTank
        self.color = color
        self.isHasSpoiler = isHasSpoiler
    }
    
}

extension SportCar: CustomStringConvertible {
    var description : String {
        return "Спортивания машина \(self.brand) с цветом \(self.color.rawValue) имеет емкость бака равную \(self.capacityFuelTank). Наличие спойлера - \(self.isHasSpoiler.rawValue)\n"
    }
}

let trunk01 = TrunkCar(brand: "MAN", capacityFuelTank: 350, color: .green, isHasTrailer: .yes)
print(trunk01)

let sportCar01 = SportCar(brand: "BMW", capacityFuelTank: 135, color: .black, isHasSpoiler: .no)
print(sportCar01)
