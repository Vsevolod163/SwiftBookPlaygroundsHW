import UIKit

//: # HomeWork 5
/*:
 ## Задание 1
 Создайте словарь, который содержит результаты игр спортивной команды. Ключом словаря должно быть название команды соперника, а в качестве значения должен быть массив с результатами игр с этим соперником. Необходимо вывести на консоль результаты игр. Выглядеть это должно примерно следующим образом:
 
 - Игра с Салават Юлаев - 3:6
 
 - Игра с Салават Юлаев - 5:5
 
 - Игра с Салават Юлаев - N/A
 
 - Игра с Авангард - 2:1
  
 - Игра с АкБарс - 3:3
 
 - Игра с АкБарс - 1:2
 */

let resultsOfGames = [
    "Авангард": ["2:1", "2:3"],
    "Салават Юлаев": ["3:6", "5:5"],
    "Акбарс": ["3:3", "1:2"]
]

for (teamName, results) in resultsOfGames {
    for result in results {
        print("Игра с \(teamName) - \(result)")
    }
}

/*:
 ## Задание 2
 Создайте функцию, которая считает общую сумму переданных в нее целочисленных значений и возвращает итоговый результат. Числа можно передавать либо в массиве, либо по отдельности, на ваше усмотрение. Вызовите функцию.
 */

func calculateAmount(_ numbers: [Int]) -> Int {
    var total = 0
    
    for number in numbers {
        total += number
    }
    
    return total
}

func calculateAmount(_ numbers: Int...) -> Int {
    var total = 0
    
    for number in numbers {
        total += number
    }
    
    return total
}

var numbers = [50, 100, 100, 500, 50, 1000, 5000, 50, 100]

calculateAmount(numbers)
calculateAmount(50, 100, 200, 200)

/*:
 ## Задание 3
 3.1 Создайте функцию, которая определяет является ли число четным. В случае, если число является четным, функция должна возвращать `true`. Иначе - `false`.
 */
/*:
 3.2 Создайте функцию, которая определяет делится ли число на *3* без остатка. Функция так же должна возвращать булево значение.
 */
/*:
 3.3 Создайте функцию, которая возвращает возрастающий массив чисел в интервале от *x* до *y*. Данный интервал должен задаваться при вызове функции при помощи параметров. Вы должны самостоятельно реализовать логику создания массива. Если хотите усложнить задание, то можете возвращать не сортированный массив чисел в заданном интервале. Главное, что бы числа были уникальными и не повторялись. При этом количество элементов массива должно соответствовать количеству элементов заданного интервала.
 */
/*:
 3.4 Создайте массив чисел от *1* до *100*, используя для этого выше созданную функцию
 */
/*:
 3.5 Создайте функцию для фильтрации переданного в неё массива. Функция должна возвращать новый массив без четных чисел. Для определения фильтруемых значений используйте ранее созданную функцию из задания **3.1**.
 */
/*:
 3.6 Создайте функцию для фильтрации переданного в неё массива. Функция должна возвращать новый массив без чисел кратных трем. Для определения фильтруемых значений используйте ранее созданную функцию из задания **3.2**.
 */
/*:
 3.7 Отфильтруйте массив из задания **3.4** при помощи двух последний функций.
 */

func isEvenNumber(_ number: Int) -> Bool {
   number % 2 == 0
}

isEvenNumber(17)

func isDivisibleByThree(_ number: Int) -> Bool {
    number % 3 == 0
}

func getAscendingArray(from minValue: Int, to maxValue: Int) -> [Int] {
    var numbers: [Int] = []
    
    for number in minValue...maxValue {
        numbers.append(number)
    }
    
    return numbers
}

func getUnsortedArray(from minValue: Int, to maxValue: Int) -> [Int] {
    var numbers: Set<Int> = []
    
    for number in minValue...maxValue {
        numbers.insert(number)
    }
    
    return Array(numbers)
}

getUnsortedArray(from: 1, to: 100)

numbers = getAscendingArray(from: 1, to: 100)

func filterOutEvenNumbers(from numbers: [Int]) -> [Int] {
    var filteredNumbers: [Int] = []
    
    for number in numbers {
        if !isEvenNumber(number) {
            filteredNumbers.append(number)
        }
    }
    
    return filteredNumbers
}


func filterOutMultipleOfThree(from numbers: [Int]) -> [Int] {
    var filteredNumbers: [Int] = []
    
    for number in numbers {
        if !isDivisibleByThree(number) {
            filteredNumbers.append(number)
        }
    }
    
    return filteredNumbers
}

numbers = filterOutEvenNumbers(from: numbers)
numbers = filterOutMultipleOfThree(from: numbers)

