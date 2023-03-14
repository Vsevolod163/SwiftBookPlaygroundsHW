import UIKit

//: # HomeWork 6
/*:
 ## Задание 1
1.1 Повторите задания 3.1 - 3.4 прошлого урока.
 */
//: 3.1 Создайте функцию, которая определяет является ли число четным. В случае, если число является четным, функция должна возвращать true. Иначе - false.
//: 3.2 Создайте функцию, которая определяет делится ли число на 3 без остатка. Функция так же должна возвращать булево значение.
//: 3.3 Создайте функцию, которая возвращает возрастающий массив чисел в интервале от x до y. Данный интервал должен задаваться при вызове функции при помощи параметров. Вы должны самостоятельно реализовать логику создания массива. Если хотите усложнить задание, то можете возвращать не сортированный массив чисел в заданном интервале. Главное, что бы числа были уникальными и не повторялись. При этом количество элементов массива должно соответствовать количеству элементов заданного интервала.
//: 3.4 Создайте массив чисел от 1 до 100, используя для этого выше созданную функцию

func isEvenNumber(_ number: Int) -> Bool {
    number % 2 == 0
}

isEvenNumber(8)

func isDivisibleByThree(_ number: Int) -> Bool {
    number % 3 == 0
}

isDivisibleByThree(3)

func numbersInInterval(from minElement: Int, to maxElement: Int) -> [Int] {
    var numbers: [Int] = []
    for number in minElement...maxElement {
        numbers.append(number)
    }
    return numbers
}

var sortedNumbers = numbersInInterval(from: 1, to: 100)

/*:
 1.2 Создайте универсальную функцию для фильтрации переданного в неё массива.
 */

/*:
 1.3 Отфильтруйте массив при помощи созданной функции, избавившись от всех четных чисел и чисел кратных трем. Для фильтрации используйте функции, определяющие кратность чисел.
 */

/*:
 1.4 Снова наполните массив числами от 1 до 100 и отфильтруйте его, используя блок замыкания универсальной функции.
 */

/*:
 1.5 Снова наполните массив числами от 1 до 100 и отфильтруйте его, используя для этого функцию высшего порядка `filter`
 */

func filteredWithClosureNumbers(numbers: [Int], closure: (Int) -> Bool) -> [Int] {
    var filteredNumbers: [Int] = []
    for number in numbers {
        if !closure(number) {
            filteredNumbers.append(number)
        }
    }
    return filteredNumbers
}

sortedNumbers = filteredWithClosureNumbers(
    numbers: sortedNumbers,
    closure: isEvenNumber
)
sortedNumbers = filteredWithClosureNumbers(
    numbers: sortedNumbers,
    closure: isDivisibleByThree
)

sortedNumbers = numbersInInterval(from: 1, to: 100)

sortedNumbers = filteredWithClosureNumbers(numbers: sortedNumbers) { $0 % 2 == 0 }
sortedNumbers

sortedNumbers = numbersInInterval(from: 1, to: 100)

sortedNumbers = sortedNumbers.filter { $0 % 2 != 0 }
sortedNumbers
