//: ## Functions and Closures
//:
//: Use `func` to declare a function. Call a function by following its name with a list of arguments in parentheses. Use `->` to separate the parameter names and types from the function’s return type.
//:
"CHRIS CLARK MARKS: PASSED"

func greet(name: String, lunchSpecial: String) -> String {
    return "Hello \(name), today's lunch special is \(lunchSpecial)."
}
print(greet("Bob",  lunchSpecial: "pizza"))


//: > **Experiment**:
//: > Remove the `day` parameter. Add a parameter to include today’s lunch special in the greeting.
//:
//: Use a tuple to make a compound value—for example, to return multiple values from a function. The elements of a tuple can be referred to either by name or by number.
//:
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)
print(statistics.0)
print(statistics.max)

//: Functions can also take a variable number of arguments, collecting them into an array.
//:
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
func averageOf(numbers: Float...) -> Float {
    var total: Float = 0.0
    var divisorValue: Float = 0.0
    var average: Float = 0.0
    for number in numbers {
        divisorValue++
        total += number
    }
    if divisorValue == 0{
        return 0
    } else {
        average = total / divisorValue
        return average
    }
}
sumOf()
sumOf(42, 601, 12)
averageOf()
averageOf(42, 601, 12)

//: > **Experiment**:
//: > Write a function that calculates the average of its arguments.
//:
//: Functions can be nested. Nested functions have access to variables that were declared in the outer function. You can use nested functions to organize the code in a function that is long or complex.
//:
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//: Functions are a first-class type. This means that a function can return another function as its value.
//:
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//: A function can take another function as one of its arguments.
//:
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            print("We have a match")
            return true
        }
    }
    print("We do not have a match")
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [13, 51, 12, 52]
hasAnyMatches(numbers, condition: lessThanTen)

//: Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces (`{}`). Use `in` to separate the arguments and return type from the body.
//:
// Returns 0 for odd numbers and 1 for evens
numbers.map({
    (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    }else {
     return 1
    }
})

//: > **Experiment**:
//: > Rewrite the closure to return zero for all odd numbers.
//:
//: You have several options for writing closures more concisely. When a closure’s type is already known, such as the callback for a delegate, you can omit the type of its parameters, its return type, or both. Single statement closures implicitly return the value of their only statement.
//:
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

//: You can refer to parameters by number instead of by name—this approach is especially useful in very short closures. A closure passed as the last argument to a function can appear immediately after the parentheses. When a closure is the only argument to a function, you can omit the parentheses entirely.
//:
// What's all this? It looks like .sort is a built-in function, 
// but what are the dollar signs about?
let sortedNumbers = numbers.sort { $0 > $1 }
print(sortedNumbers)



//: [Previous](@previous) | [Next](@next)
