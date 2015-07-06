//
//  User.swift
//  SwiftL2
//
//  Created by Ivan Babich on 06.07.15.
//  Copyright (c) 2015 Eventagrate. All rights reserved.
//

import Foundation

//Структура для отображения в каждой ячейке
//Модель данных
struct User {
    init(name:String,age:Int?) {
        self.name = name
        self.age = age
    }
    var name:String = ""
    var age:Int?
    
    // Мутирующая функция,которая меняет имя и возраст
    mutating func newUser(name: String,age: Int?) {
        self.name = name
        self.age = age
    }
}

// Расширение,проверяющее age на optional type
extension User {
    func ageIsOptionalType(ageNames:Int?) -> String {
        if let age = ageNames as Int?{
            return "\(age)"
        }else{
            return "No Age"
        }
    }
}

// Расширение,которое преобразует буквы в заглавные
extension String {
    func toUpper() -> String {
        return self.uppercaseString
    }
}
