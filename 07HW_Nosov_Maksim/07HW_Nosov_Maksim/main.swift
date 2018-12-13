//
//  main.swift
//  07HW_Nosov_Maksim
//
//  Created by NosovML on 11/12/2018.
//  Copyright © 2018 NosovML. All rights reserved.
//

import Foundation

//1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
//2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum GroupOfStudentsError: Error {
    case notFound
}

struct Person {
    let name: String
    let surname: String
    let age: Int
    var score: Int
}

class GroupOfStudents {
    // студенты
    var students = [
        "001": Person(name: "Maksim", surname: "Nosov", age: 35, score: 2),
        "002": Person(name: "Alex", surname: "Bondarenko", age: 34, score: 5),
        "003": Person(name: "Evgeny", surname: "Zverik", age: 27, score: 3),
        "004": Person(name: "Alexey", surname: "Kanatyev", age: 28, score: 4)
    ]
    
    func getInfo(number student: String) throws -> Person {
        guard let man = students[student] else {
            throw GroupOfStudentsError.notFound
        }
        return man
    }
    
}

extension Person: CustomStringConvertible {
    public var description: String {
        return "Студент \(surname) \(name) с возрастом \(age) имеет \(score) балла/ов."
    }
}

let students = GroupOfStudents()
do {
    let student = try students.getInfo(number: "0010")
    print(student.description)
} catch GroupOfStudentsError.notFound {
    print("Студент не найден")
}
