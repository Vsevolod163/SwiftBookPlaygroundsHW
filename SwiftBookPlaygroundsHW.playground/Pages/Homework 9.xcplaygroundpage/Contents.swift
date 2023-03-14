import UIKit

//: # HomeWork 9

/*:
 ## Задание 1
 1.1 Создайте перечисление `CalculationType`, содержащее четыре математических действия — *сложение*, *вычитание*, *умножение* и *деление*.
 */
//: 1.2 Напишите функцию возвращающую `Int` и принимающую в качестве параметров три значения: число один, число два и тип математической операции. Внутри функции, в зависимости от значения параметра `CalculationType` выполните соответствующую математическую операцию со значениями и верните результат. Реализуйте функцию таким образом, что бы при каждом её вызове на консоль выводилось сообщение следующего содержания: «Результат сложения (вычитания, деления, умножения) <…> и <…> равен <…>».
//: 1.3 Вызовите эту функцию четыре раза для каждого математического оператора в отдельности.


enum CalculationType {
    case addition
    case subtraction
    case multiplication
    case division
}

func calculateValues(
    numberOne: Int,
    numberTwo: Int,
    type: CalculationType
) -> Int? {
        
    let resultValue: Int
    
    switch type {
    case .addition:
        resultValue = numberOne + numberTwo
    case .subtraction:
        resultValue = numberOne - numberTwo
    case .multiplication:
        resultValue = numberOne * numberTwo
    case .division:
        if numberTwo != 0 {
            resultValue = numberOne / numberTwo
        } else {
            print("На ноль делить нельзя")
            return nil
        }
        
    }
    
    print("Result of \(type) \(numberOne) and \(numberTwo) is \(resultValue)")
    
    return resultValue
}

calculateValues(numberOne: 3, numberTwo: 5, type: .addition)
calculateValues(numberOne: 12, numberTwo: 3, type: .subtraction)
calculateValues(numberOne: 7, numberTwo: 5, type: .multiplication)
calculateValues(numberOne: 20, numberTwo: 4, type: .division)

print()

/*:
 ## Задание 2
 2.1 Создайте перечисление `DistanceUnit` (Единица измерения расстояния) со следующими кейсами: `versta`, `kilometer`, `mile`.
 
 Внутри перечисления `DistanceUnit` создайте еще одно перечисление `NonISUCountry` в котором содержится перечень стран не принявших международную систему единиц (США, Либерия и Мьянма).
 
 Верста и километр должны иметь ассоциативный параметры следующего типа: `(title: String, denotation: String, countries: [String])`. Миля - `(title: String, denotation: String, countries: [NonISUCountry])`. Первый параметр - это название единицы измерения, второй параметр отвечает за обозначение единицы, а массив должен содержать перечень стран в которых используется эта единица (для километра не обязательно перечислять все страны).
 */
/*:

 2.2 Создайте по экземпляру DistanceUnit для каждого кейса и функцию, которая должна принимать единицу измерения и выводить на консоль информацию о ней, например: "Километр. Краткое наименование: км. Страны: Россия, Евросоюз".
 */

enum DistanceUnit {
    enum NonISUCountry: String {
        case usa = "USA"
        case liberia = "Liberia"
        case mianma = "Mianma"
    }
    
    case versta(title: String, denotation: String, countries: [String])
    case kilometer(title: String, denotation: String, countries: [String])
    case mile(title:String, denotation: String, countries: [NonISUCountry])
}

let distanceUnitKilometer: DistanceUnit = .kilometer(
    title: "Kilometer",
    denotation: "km",
    countries: ["Russia", "ES"]
)
let distanceUnitVersta: DistanceUnit = .versta(
    title: "Versta",
    denotation: "v",
    countries: ["Russia"]
    
)

let mile: DistanceUnit = .mile(
    title: "Mile",
    denotation: "ml",
    countries: [.usa, .liberia, .mianma]
)

func showInformation(type: DistanceUnit) {
    switch type {
    case let .versta(title, denotation, countries),
        let .kilometer(title, denotation, countries):
        print("\(title). Denotation: \(denotation). Countries: \(countries.formatted())")
    case let .mile(title, denotation, countries):
        let nonISUCountries = countries.map { $0.rawValue }
        print("\(title). Denotation: \(denotation). Countries: \(nonISUCountries.formatted())")
    }
}

showInformation(type: distanceUnitVersta)
showInformation(type: distanceUnitKilometer)
showInformation(type: mile)



