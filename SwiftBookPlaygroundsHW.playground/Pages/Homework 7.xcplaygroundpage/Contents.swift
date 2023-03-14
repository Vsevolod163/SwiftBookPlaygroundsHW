import Foundation

//: # HomeWork 7

/*:
 ## Задание 1
 1.1 Создайте класс `Orange` со следующими свойствами:
 
 - `color: String`
 
 - `taste: String`
 
 - `radius: Double`
 
 Необходимо реализовать возможность создания экземпляра класса со значениями по умолчанию для свойств *color* и *taste*. Свойство *radius* должно быть обязательным для инициализации, т.е. не должно быть возможности создания экземпляра класса без радиуса.
 
 Объявите геттер *orangeVolume*, возвращающий объем апельсина. При этом расчет объема необходимо реализовать в методе *calculateOrangeVolume* (число Пи в Swift можно получить через константу `Double.pi`. Формулу расчета можно погуглить).
 
 Создайте экземпляр класса `Orange`, вызвав при этом инициализатор только для радиуса. Остальным свойствам, созданного экземпляра присвойте следующие значения:
 
 - `color` — *Orange*

 - `taste` — *Sweet*
 
 Выведите на консоль сообщение: «Orange has <...> color and <...> taste. The volume of orange is <...>», обращаясь к этим значениям через экземпляр класса.
 */

class Orange {
    var color = ""
    var taste = ""
    let radius: Double
    
    var orangeVolume: Double {
        calculateOrangeVolume()
    }

    init(radius: Double) {
        self.radius = radius
    }
    
    private func calculateOrangeVolume() -> Double {
        4 / 3 * Double.pi * pow(radius, 3)
    }
}

let orange = Orange(radius: 1.0)
orange.color = "Orange"
orange.taste = "Sweet"

print("Orange has \(orange.color) color and \(orange.taste) taste. The volume of orange is \(orange.orangeVolume)\n")

/*:
 ## Задание 2
 2.1 Создайте класс `Employee` (сотрудник) со следующими свойствами:
 
 - `salary`
 
 - `name`
 
 - `surname`
 */

//: 2.2 Создайте массив `names` со следующими именами: *John*, *Aaron*, *Tim*, *Ted*, *Steven*. И еще один массив `surnames` со следующими фамилиями: *Smith*, *Dow*, *Isaacson*, *Pennyworth*, *Jankins*. Массивы должны быть созданы вне класса.

//: 2.3 Объявите массив `employees` и создайте цикл, в котором он заполняется десятью объектами класса `Employee` таким образом, что свойства `name` и `surname` инициализируются случайными именами и фамилиями из массивов `names` и `surnames`, соответственно. Свойство `salary` (зарплата) тоже должно генерироваться в случайном диапазоне от *$1000* до *$2000*

//: 2.4 Переберите массив `employees` и выведите информацию по каждому сотруднику в виде: «<имя> <фамилия>’s salary is $<... >»

//: 2.5 Создайте еще один массив на основе `employees`, который включает только тех работников, чья зарплата чётная. Выведите информацию по каждому сотруднику с четной зарплатой, как в пункте 2.4



class Employee {
    let name: String
    let surname: String
    let salary: Int
    
    init(salary: Int, name: String, surname: String) {
        self.salary = salary
        self.name = name
        self.surname = surname
    }
}

let names = ["John", "Aaron", "Tim", "Ted", "Steven"]
let surnames = ["Smith", "Dow", "Isaacson", "Pennyworth", "Jankins"]

var employees: [Employee] = []

for _ in 1...10 {
    employees.append(
        Employee(
            salary: Int.random(in: 1000...2000),
            name: names.randomElement() ?? "",
            surname: surnames.randomElement() ?? ""
        )
    )
}

for employee in employees {
    print("\(employee.name) \(employee.surname) salary is \(employee.salary)")
}

print()

var employeesEvenSalary: [Employee] = []

for employee in employees {
    if employee.salary % 2 == 0 {
        employeesEvenSalary.append(employee)
    }
}

for employee in employeesEvenSalary {
    print("\(employee.name) \(employee.surname) salary is \(employee.salary)")
}

employeesEvenSalary.forEach { employee in
    print("\(employee.name) \(employee.surname) salary is \(employee.salary)")
}

// Использование функции filter высшего порядка

employeesEvenSalary = employees.filter { employee in
    employee.salary.isMultiple(of: 2)
}

employeesEvenSalary = employees.filter { $0.salary.isMultiple(of: 2) }

employeesEvenSalary.forEach {
    print("\($0.name) \($0.surname)'s salary is \($0.salary)$")
}

