//
//  Person.swift
//  lab2_2
//
//  Created by Nemo on 16/04/2026.
//

import Foundation

class Person{
    var salary:Double = 0
    
    init(salary: Double) {
        self.salary = salary
    }
    
    func getSalary()->Double{
        return salary
    }
}

class Employee:Person{
    override func getSalary() -> Double {
        return salary*5
    }
}

class Manager:Person{
    override func getSalary() -> Double {
        return salary*10
    }
}
