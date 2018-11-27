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



enum EngineState: String {
    case start = "запущен", stop = "остановлен"
}

enum WindowState: String {
    case open = "открыто", close = "закрыто"
}

enum TrunkAction {
    case load, unload
}

// создал только одну структуру для легкового автомобиля. Для грузовика, то же самое.
struct Car {
    var brand: String
    var dateIssue: String
    var capacityTrunk: Int
    var capacityTrunkFilled: Int = 0 {
         didSet {
            if (capacityTrunkFilled > capacityTrunk) {
                print("Объем превышает ёмкость багажника.")
                capacityTrunkFilled = oldValue
            } else if (capacityTrunkFilled < 0) {
                print("Ошибка! Отрицательное значение.")
            }
        }
    }
    
    var engineState: EngineState
    var windowState: WindowState

    mutating func engineAction(state: EngineState) -> Void {
        switch state {
        case .start:
            self.engineState = .start
            print("Включен двигатель")
        case .stop:
            self.engineState = .stop
            print("Двигатель выключен")
        }
    }

    mutating func windowAction(state: WindowState) -> Void {
        switch state {
        case .open:
            self.windowState = .open
            print("Окно открыто")
        case .close:
            self.windowState = .close
            print("Окно закрыто")
        }
    }
    
    mutating func loadAction(action state: TrunkAction, weight: Int) {
        switch state {
        case .load:
            self.capacityTrunkFilled += weight
        case .unload:
            self.capacityTrunkFilled -= weight
        }
    }
    
    func getInfoAboutVehicle() {
        print("\n====Информация об автомобиле====")
        print("Автомобиль \(self.brand) выпуска \(dateIssue) загружен на \(self.capacityTrunkFilled) из \(self.capacityTrunk) возможных.\nДвигатель в состоянии \"\(self.engineState.rawValue)\".\nОкно \(self.windowState.rawValue)")
        print("====\n")
    }
}

// Создаем экземпляры структруы
var car01 = Car(
    brand: "Honda",
    dateIssue: "01/02/2015",
    capacityTrunk: 100,
    capacityTrunkFilled: 0,
    engineState: .stop,
    windowState: .close)

var car02 = Car(
    brand: "BMW",
    dateIssue: "06/07/2013",
    capacityTrunk: 120,
    capacityTrunkFilled: 100,
    engineState: .stop,
    windowState: .open)

car01.getInfoAboutVehicle()
print("Попытка перегрузить автомобиль")
car01.capacityTrunkFilled = 150
car01.loadAction(action: .load, weight: 40)
car01.engineAction(state: .start)
car01.getInfoAboutVehicle()

car02.getInfoAboutVehicle()
print("Попытка присвоить отрицательное значение объема загруженности")
car02.loadAction(action: .unload, weight: 150)
car02.loadAction(action: .load, weight: 100)
car02.windowAction(state: .close)
car02.getInfoAboutVehicle()


