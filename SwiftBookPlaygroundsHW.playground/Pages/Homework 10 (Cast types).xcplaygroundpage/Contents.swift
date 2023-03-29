/*:
Упражнение - приведение типов и их контроль

1.1 Создайте коллекцию типа [Any], включающую несколько дробных чисел, целых, строк и значений логического типа. Выведите содержимое коллекции на консоль.
*/
let items: [Any] = [5, 3.3, "Hello", 7.7, 8, true, "World", false]

/*:
 1.2 Переберите коллекцию и для каждого целого числа выведите на консоль "Целое число " и его значение. Повторите то же самое для дробных чисел, строк и булевых значений.
 */



/*:
 1.3 Создайте словарь [String : Any], где все значения — это смесь дробных и целых чисел, строк и булевых значений. Переберите словарь и выведете на консоль пары ключ/значения для всех элементов коллекции.
 */


/*:
 1.4 Создайте переменную `total` типа `Double`, равную 0. Переберите все значения словаря, и добавьте значение каждого целого и дробного числа к значению вашей переменной. Для каждой строки добавьте 1. Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`. Выведите на консоль значение `total`.
 */


/*:
 1.5 Обнулите переменную total и снова пройдите по всей коллекции, прибавляя к ней все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему. Игнорируйте булевы значения.  Распечатайте итог.
 */

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

class Run: Workout {    // бег
    let cadence: Double // темп
    
    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {   // плавание
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


/*:
 Переберите все тренировки в массиве `workouts` и, с помощью приведения типов, вызовите либо `describeRun(runningWorkout:)`, либо `describeSwim(swimmingWorkout:)` для каждого. Обратите внимание, что будет выведено в консоль.
 */


/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */

