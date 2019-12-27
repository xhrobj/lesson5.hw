import Foundation

// Программа, моделирующая фабрику по производству строительных материалов // ???: 😵
// Напишите программу, которая моделирует фабрику по производству строительных материалов.
//
// Опишите в программе два класса: Человек (ФИО, возраст, паспорт), Паспорт (Серия, Номер, дата выдачи, Человек) и инициализируйте их.

class Person {
    private(set) var firstName: String
    private(set) var lastName: String
    private(set) var middleName: String
    private(set) var age: Int
    
    private(set) var passport: Passport?
    
    init(firstName: String, lastName: String, middleName: String, age: Int, passport: Passport? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.age = age
        if let passport = passport {
            issuePassport(passport)
        }
    }
    
    func issuePassport(_ passport: Passport) {
        self.passport = passport
        passport.issuePassport(to: self)
    }
}

extension Person: CustomStringConvertible {
    var description: String {
        var result = "👽 \(firstName) \(middleName) \(lastName), \(age)"
        if let passport = passport {
            result.append(" \(passport)")
        } else {
            result.append(" Паспорт не выдан")
        }
        return result
    }
}

class Passport {
    private(set) var series: String
    private(set) var number: String
    private(set) var dateOfIssue: Date
    
    weak private(set) var person: Person?

    init(series: String, number: String, dateOfIssue: Date) {
        self.series = series
        self.number = number
        self.dateOfIssue = dateOfIssue
    }
    
    func issuePassport(to person: Person) {
        self.person = person
    }
}

extension Passport: CustomStringConvertible {
    var description: String {
        "🎫 \(series) \(number) \(dateOfIssue)"
    }
}

let person = Person(firstName: "Василий", lastName: "Петрович", middleName: "Иванов", age: 42)
let passport = Passport(series: "12 34", number: "123456", dateOfIssue: Date())

print("Гражданин:", person)
print("Паспорт:", passport)
print("Кому выдан паспорт:", passport.person ?? "Не выдан")

person.issuePassport(passport)

print("\n")
print("Гражданин:", person)
print("Кому выдан паспорт:", passport.person ?? "Не выдан")

let person2 = Person(firstName: "Ольга", lastName: "Логинова", middleName: "Владимировна", age: 18, passport: Passport(series: "23 45", number: "234567", dateOfIssue: Date()))
print("\n")
print(person2)
