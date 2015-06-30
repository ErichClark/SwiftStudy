//: ## Generics
//:
//: Write a name inside angle brackets to make a generic function or type.
//:
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes:4)

//: You can make generic forms of functions and methods, as well as classes, enumerations, and structures.
//:
// Reimplement the Swift standard library's optional type
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

//: Use `where` after the type name to specify a list of requirements—for example, to require the type to implement a protocol, to require two types to be the same, or to require a class to have a particular superclass.
//:
// Gotta be honest, this one was beyond me. I grabbed some code from the internet, which did not work, but I fixed it. they used "Sequence" and "GeneratorType", instead of "SequenceType" and "Generator" I do understand what it"s doing, but yeah, never would have gotten there without the boost.

func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, rhs: U) -> [T.Generator.Element] {
    var commonElements : [T.Generator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(lhsItem)
            }
        }
    }
   return commonElements
}
 
anyCommonElements([1, 2, 3], rhs: [3]) // 3
//: > **Experiment**:
//: > Modify the `anyCommonElements(_:_:)` function to make a function that returns an array of the elements that any two sequences have in common.
//:
//: In the simple cases, you can omit `where` and simply write the protocol or class name after a colon. Writing `<T: Equatable>` is the same as writing `<T where T: Equatable>`.
//:


//: [Previous](@previous)
