//
//  main.swift
//  03HW_Nosov_Maksim
//
//  Created by NosovML on 27/11/2018.
//  Copyright © 2018 NosovML. All rights reserved.
//

/* 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.

2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль. */

import Foundation

enum EngineState {
    case start, stop
}

enum WindowState {
    case open, close
}

enum TrunkAction {
    case load, unload
}

struct Car {
    var brand: String
    var dateIssue: String
    var capacityTrunk: Int
    var capacityTrunkFilled: Int {
        get { return capacityTrunkFilled }
        set (new) {
//            let old = capacityTrunkFilled
            if (new <= capacityTrunk) {
                capacityTrunkFilled = new
            } else {
                print("Ошибка! Объем заполненности не может превышать номинальный объем багажника")
            }
        }
    }
    
    var engineState: EngineState
    var windowState: WindowState
    
    mutating func engineAction(state: EngineState) -> Void {
        switch state {
        case .start:
            self.engineState = .start
        case .stop:
            self.engineState = .stop
        }
    }
    
    mutating func windowction(state: WindowState) -> Void {
        switch state {
        case .open:
            self.windowState = .open
        case .close:
            self.windowState = .close
        }
    }
    
}

//var car01 = Car(
//    brand: "Honds",
//    dateIssue: "01/02/2015",
//    capacityTrunk: 100,
//    capacityTrunkFilled: 0,
//    engineState: .stop,
//    windowState: .close)

var car01 = Car(brand: "Honda", dateIssue: "01/10/2016", capacityTrunk: 100, engineState: .stop, windowState: .close)

print(car01.capacityTrunkFilled)
car01.capacityTrunkFilled = 150
print(car01.capacityTrunkFilled)

struct Truck {
    var brand: String
    var dateIssue: Date
    var capacityTrunk: Int
    var capacityTrunkFilled: Int
    var engineState: EngineState
    var windowState: WindowState
}
