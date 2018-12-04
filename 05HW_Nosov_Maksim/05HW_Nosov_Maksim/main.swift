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

enum Transmission {
    case auto, manual
}

enum ActionWindow {
    case open, close
}

enum ActionDoor {
    case open, close
}

protocol Car {
    var brand: String { get set }
    var capacityFuelTank: Int { get set }
    var countCar: Int { get set }
    associatedtype ColorEnum
    associatedtype TransmissionEnum
    
    func Honk()
    func getInfo()
    func countInfo()
    
    func actionWindow()
    func actionDoor()
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
    
    func actionDoor(action: ActionDoor) {
        switch action {
        case .open:
            print("Дверь открыта")
        case .close:
            print("Дверь закрыта")
        }
    }
}

var color: Color
var transmission: Transmission
