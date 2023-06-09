/*:
Упражнение - приведение типов и их контроль

1.1 Создайте коллекцию типа [Any], включающую несколько дробных чисел, целых, строк и значений логического типа. Выведите содержимое коллекции на консоль.
*/
let items: [Any] = [5, 3.3, "Hello", 7.7, 8, true, "World", false]

for item in items {
    print(item)
}

print()
/*:
 1.2 Переберите коллекцию и для каждого целого числа выведите на консоль "Целое число " и его значение. Повторите то же самое для дробных чисел, строк и булевых значений.
 */
for item in items {
    if item is Int {
        print("Целое число")
    } else if item is Double {
        print("Дробное число")
    } else if item is String {
        print("Строка")
    } else if item is Bool {
        print("Булевое значение")
    }
}
print()

for item in items {
    switch item {
    case is Int:
        print("\(item) is Integer")
    case is String:
        print("\(item) is String")
    case is Bool:
        print("\(item) is Bool")
    case is Double:
        print("\(item) is Double")
    default:
        print("Unknown value: \(item)")
    }
}
print()
/*:
 1.3 Создайте словарь [String : Any], где все значения — это смесь дробных и целых чисел, строк и булевых значений. Переберите словарь и выведете на консоль пары ключ/значения для всех элементов коллекции.
 */
let elements: [String: Any] = [
    "firstBool": false,
    "Double": 7.5,
    "firstString": "Hello",
    "Integer": 7,
    "secondBool": true,
    "secondString": "5"
]

for element in elements {
    print("Key: \(element.key), Value: \(element.value)")
}

print()

for (type, value) in elements {
    print("\(type) \(value)")
}

print()
/*:
 1.4 Создайте переменную `total` типа `Double`, равную 0. Переберите все значения словаря, и добавьте значение каждого целого и дробного числа к значению вашей переменной. Для каждой строки добавьте 1. Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`. Выведите на консоль значение `total`.
 */
var total = 0.0

for (_, value) in elements {
    if let doubleValue = value as? Double {
        total += doubleValue
    } else if let integerValue = value as? Int {
        total += Double(integerValue)
    } else if let boolValue = value as? Bool {
        total += boolValue ? 2 : -3
    } else if value is String {
        total += 1
    }
}

print(total)
print()

for value in elements {
    switch value {
    case let value as Double:
        total += value
    case let value as Int:
        total += Double(value)
    case let value as Bool:
        total += value ? 2 : -3
    case is String:
        total += 1
    default:
        break
    }
}

print(total)
print()
/*:
 1.5 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему. Игнорируйте булевы значения.  Распечатайте итог.
 */
total = 0

for (_, value) in elements {
    if let integerValue = value as? Int {
        total += Double(integerValue)
    } else if let doubleValue = value as? Double {
        total += doubleValue
    } else if let stringValue = value as? String {
        total += Double(stringValue) ?? 0
    }
}

print(total)
print()
/*:
Упражнение для приложения - типы тренировок

Эти упражнения закрепляют понимание Swift в контексте фитнес-приложения.

Ваше приложение позволяет отслеживать разные типы тренировок.  При проектировании приложения вы решили создать базовый клас Workout, от которого будут наследовать все остальные классы с разными типами тренировок.  Ниже определены три класса. Workout — базовый класс со свойствами time (время) и distance (дистанция), а Run (бег) и Swim (плавание) — классы-наследники, добавляющие специфичные свойства классу Workout.

Также определён массив workouts (тренировки), представляющий собой журнал предыдущих тренировок.  Вы используете классы и массив для упражнений ниже.
 */

class Workout {             // тренировка
    let time: Double        // время
    let distance: Double    // дистанция
    
    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

final class Run: Workout {    // бег
    let cadence: Double // темп
    
    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

final class Swim: Workout {   // плавание
    let stroke: String  // стиль
    
    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "вольный стиль", time: 32.1, distance: 50),
    Swim(stroke: "баттерфляй", time: 36.8, distance: 50),
    Swim(stroke: "вольный стиль", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]

/*:
 Напишите функции `describeRun(runningWorkout:)` и `describeSwim(swimmingWorkout:)`, принимающие объекты типа `Run` и `Swim` соответственно. Ни одна не должна возвращать значений. Каждая функция должна вывести описание тренировки, включая темп бега, либо стиль плавания. Время представлено в секундах, расстояние — в метрах, темп — в шагах в минуту.
 */
func describeRun(runningWorkout: Run) {
    print("Темп: \(runningWorkout.cadence)\nВремя: \(runningWorkout.time)\nДистанция: \(runningWorkout.distance)\n")
}

func describeSwim(swimmingWorkout: Swim) {
    print("Cтиль: \(swimmingWorkout.stroke)\nВремя: \(swimmingWorkout.time)\nДистанция: \(swimmingWorkout.distance)\n")
}
/*:
 Переберите все тренировки в массиве `workouts` и, с помощью приведения типов, вызовите либо `describeRun(runningWorkout:)`, либо `describeSwim(swimmingWorkout:)` для каждого. Обратите внимание, что будет выведено в консоль.
 */
for workout in workouts {
    if let workout = workout as? Run {
        describeRun(runningWorkout: workout)
    } else if let workout = workout as? Swim{
        describeSwim(swimmingWorkout: workout)
    }
}
/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */

