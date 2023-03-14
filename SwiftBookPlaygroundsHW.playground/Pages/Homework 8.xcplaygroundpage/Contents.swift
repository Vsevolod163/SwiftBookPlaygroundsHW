import UIKit

//: # HomeWork 8
 
/*:
 ## Задание 1
 1.1 Создайте базовый класс `Shape` со следующими вычисляемыми свойствами:
 
 - `area: Double`
 
 - `perimeter: Double`
 
 - `description: String`
 
 Свойство `description` должно возвращать сообщение следующего вида: «The area of <...> is <...>. Perimeter - <...>»
 */
/*:
 1.2. Создайте классы `Circle` и `Rectangle`, унаследовав их от `Shape`. Переопределите свойства `area` и `perimeter` для каждого класса в соответствии с правилом расчета площади и периметра (длины) конкретной фигуры.
 */
/*:
 1.3. Создайте класс `Ellipse`, унаследовав его от `Rectangle`. Переопределите свойства `area` и `perimeter` в соответствии с правилом расчета площади и периметра эллипса (для расчета нужно использовать ширину и высоту).
 */
//: 1.4 Создайте по экземпляру каждого класса, кроме `Shape` и выведите значение свойства `description` на консоль.

class Shape {
    var area: Double {
        0
    }
    var perimeter: Double {
        0
    }
    
    var description: String {
        "The area of \(type(of: self)) is \(area). Perimeter - \(perimeter)"
    }
}

final class Circle: Shape {
    let radius: Double
    
    override var area: Double {
        Double.pi * pow(radius, 2)
    }
    
    override var perimeter: Double {
        radius * 2 * Double.pi
    }
    
    init(radius: Double) {
        self.radius = radius
    }
}

class Rectangle: Shape {
    let width: Double
    let heigth: Double
    
    override var area: Double {
        width * heigth
    }
    
    override var perimeter: Double {
        2 * (width + heigth)
    }
    
    init(width: Double, heigth: Double) {
        self.width = width
        self.heigth = heigth
    }
}

class Ellipse: Rectangle {
    override var area: Double {
        Double.pi * width * heigth
    }
    
    override var perimeter: Double {
        Double.pi * (width + heigth)
    }
}

let circle = Circle(radius: 3.0)
let rectangle = Rectangle(width: 2.0, heigth: 3.0)
let ellipse = Ellipse(width: 2.0, heigth: 3.0)

print(circle.description)
print(rectangle.description)
print(ellipse.description)
print()

/*:
 ## Задание 2
 2.1 Создайте структуру `Car` со следующими свойствами:
 - `model: String`
 - `power: Int`
 - `description: String`
 
 Свойство `description` должно возвращать сообщение с названием автомобиля и его мощность в лошадиных силах.
 
 Так же необходимо реализовать метод `increasePower`, который должен увеличить мощность автомобиля на заданное количество лошадиных сил.
  */
/*:
 2.2 Создайте экземпляр структуры и инициализируйте её свойства. Выведите значение свойства `description` на консоль, а затем вызовите метод `increasePower`. Снова выведите значение свойства `description` на консоль.
*/

struct Car {
    let model: String
    var power: Int
    
    var description : String {
        "Model - \(model), Power - \(power) "
    }
    
    mutating func increase(power: Int) {
        self.power += power
    }
}

var car = Car(model: "BMW", power: 200)

print(car.description)

car.increase(power: 50)

print(car.description)

