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
    case started, stopped
}

enum WindowState {
    case opened, closed
}

struct Car {
    var brand: String
    var dateIssue: Date
    var capacityTrunk: Int
    var capacityTrunkFilled: Int
    var engineState: EngineState
    var windowState: WindowState
}

struct Truck {
    var brand: String
    var dateIssue: Date
    var capacityTrunk: Int
    var capacityTrunkFilled: Int
    var engineState: EngineState
    var windowState: WindowState
}
