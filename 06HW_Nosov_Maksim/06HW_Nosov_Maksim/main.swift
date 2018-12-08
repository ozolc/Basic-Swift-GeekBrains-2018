//
//  main.swift
//  06HW_Nosov_Maksim
//
//  Created by Maksim Nosov on 08/12/2018.
//  Copyright © 2018 Maksim Nosov. All rights reserved.
//

import Foundation

//MARK: Tasks
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


//MARK: 01_01. Queue - unefficient realization
// Реализация QUEUE с использованием GENERICs. (менее эффективная реализация, за счет специфики массивов в Swift.
// При добавлении новых элементов в конец массива, из-за резервирования памяти в "пустых" элементах в конце, временная сложность алгоритма равна O(1). Поэтому скорость добавления элементов постоянная. Когда последняя "пустая" ячейка инициализируется данными и мы добавляем еще один элемент, массив будет расширятся новыми "пустыми" ячейками.
//  Удаление из массива имеет O-нотацию равную O(n), потому, что требует весь оставшийся массив элементов перераспределить свои элементы. Над этим поработаю в следующей реализации очереди.

public struct Queue<T>: CustomStringConvertible {
    
    // Массив для добавления элементов в очередь. Использовал парадигму "Инкапсуляция". Массив может быть использован только в исходном файле, в котором определен.
    
    fileprivate var array = [T]()
    
    // Проверка массива на отсутствие элементов
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    // Получаем количество элементов в очереди
    fileprivate var count: Int {
        return array.count
    }
    
    public func getCount() -> String {
        return "Количество элементов в очереди: \(count)"
    }
    
    // Метод для добавления нового элемента в очередь. 
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // Метод для удаления первого элемента из массива array. Возвращает Optional <T> при проверке на пустой массив.
    public mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            let removedElement = array.first
            print("Удален элемент: \(String(describing: removedElement!))")
            return array.removeFirst()
        }
    }
    
    // Метод для получения первого элемента очереди
    public var front: T? {
        return array.first
    }
    
    public var description: String {
        return "Содержимое очереди: \(self.array)"
    }
}

print("Реализация очереди с использованием Generics - (медленная реализация)")
var q01 = Queue<String>()
print(q01)
q01.enqueue("Swift")
q01.enqueue("C++")
q01.enqueue("Java")
print(q01.getCount())

while (q01.count > 0) {
q01.dequeue()
print(q01)
print(q01.getCount())
}
print("=========")

// MARK: 01_02. Queue - more efficient realization
// Более эффективная реализация очереди.
// При удалении первого элемента из очереди, не производится постоянное перемещение оставшихся элементов к началу очереди. Удаляемый элемент помечается в массиве как пустой.
// Периодически (в зависимости от коэффицента, вычисляемого как деление удаляемого элемента на количество элементов в массиве, и общего количества элементов), производится усечение массива посредством перемещения оставшихся элементов к началу массива.

public struct QueueEfficient<T>: CustomStringConvertible {
    // массив типа <T?>, так как производится пометка ячейка памяти, в которой хранится элемент как "пустой."
    fileprivate var array = [T?]()
    // Индекс первого элемента в массиве
    fileprivate var head = 0
    
    public var count: Int {
        return array.count - head
    }
    
    public func getCount() -> String {
        return "Количество элементов в очереди: \(count)"
    }
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil // Для удаления объекта из массива
        head += 1 // Для присваивания значения "первый" элемент в массиве следующему за удаленным элементом array[head].
        
        // Процент пустых ячеек, на основе которых будет производится периодическое усечение неиспользуемых ячеек памяти используемых массивом.
        let percentage = Double(head) / Double(array.count)
        
        // С количеством элементов и процентом в условии можно поиграться при тестировании.
        if array.count > 10 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    // Возвращение первого элемента в очереди
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
    public var description: String {
        return "Содержимое очереди: \(self.array)"
    }
    
}

print("Реализация очереди с использованием Generics - (оптимизированная реализация)")
var q02 = QueueEfficient<String>()
print(q02)
q02.enqueue("Perl")
q02.enqueue("Go")
q02.enqueue("Kotlin")
print(q02.getCount())

while (q02.count > 0) {
    q02.dequeue()
    print(q02)
    print(q02.getCount())
}
print("=========")






























