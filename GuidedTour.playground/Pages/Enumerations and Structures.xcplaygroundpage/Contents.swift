//: ## Enumerations and Structures
//:
//: Use `enum` to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
//:
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
func compareCards(card1: Rank, card2: Rank){
    let firstCardValue: Int = card1.rawValue
    let secondCardValue: Int = card2.rawValue

    if (firstCardValue == 1 || secondCardValue == 1) {
        print("Aces are low.")
    }
    if (firstCardValue > secondCardValue) {
        print("The \(card1.simpleDescription()) beats the  \(card2.simpleDescription()). First card wins!" )
    }else if (firstCardValue < secondCardValue) {
    print("The \(card2.simpleDescription()) beats the \(card1.simpleDescription()). Second card wins!")
    }else if (firstCardValue == secondCardValue) {
        print("These are the same card. I de-clare war!")
    }else {
        print("I don't recognize these cards")
    }
}
compareCards(Rank.Ace, card2: Rank.Four)
compareCards(Rank.Queen, card2: Rank.King)
compareCards(Rank.Ace, card2: Rank.Ace)
compareCards(Rank.Jack, card2: Rank.Five)
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let jack = Rank.Jack
let jackRawValue = jack.rawValue
print(jack.rawValue)

//: > **Experiment**:
//: > Write a function that compares two `Rank` values by comparing their raw values.
//:
//: In the example above, the raw-value type of the enumeration is `Int`, so you only have to specify the first raw value. The rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the `rawValue` property to access the raw value of an enumeration member.
//:
//: Use the `init?(rawValue:)` initializer to make an instance of an enumeration from a raw value.
//:
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
    print("\(threeDescription)")
}

//: The member values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
//:
enum Suit: Int {
    case Spades = 1
    case Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
    func color() -> String {
        switch self {
            case .Spades, .Clubs:
                return "black"
            case .Hearts, .Diamonds:
                return "red"
            }
    }
}


print("\(Suit.Hearts.simpleDescription()) are \(Suit.Hearts.color())")

//: > **Experiment**:
//: > Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
//: Notice the two ways that the `Hearts` member of the enumeration is referred to above: When assigning a value to the `hearts` constant, the enumeration member `Suit.Hearts` is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration member is referred to by the abbreviated form `.Hearts` because the value of `self` is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.
//:
//: Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
//:
func makeDeck() {
    print("Here's your deck, sir.")
    var a = 1
    while let suit = Suit(rawValue: a) {
        var b = 1
        while let rank = Rank(rawValue: b) {
            print("\(rank.simpleDescription()) of \(suit.simpleDescription())")
            b++
        }
    a++
    }
}
makeDeck()




//: > **Experiment**:
//: > Add a method to `Card` that creates a full deck of cards, with one card of each combination of rank and suit.
//:
//: An instance of an enumeration member can have values associated with the instance. Instances of the same enumeration member can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration member is the same for all of its instances, and you provide the raw value when you define the enumeration.
//:
//: For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.
//:
// No idea what's going on here.

enum ServerResponse {
    case Result(String, String, String)
    case Error(String)
    case Success(String)
}
 
let success = ServerResponse.Result("6:00 am", "5:00 pm", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")
let success = ServerResponse.Success("A great day!")

switch success {
    case let .Result(sunrise, teatime, sunset):
        let serverResponse = "Sunrise is at \(sunrise), tea is at \(teatime), and sunset is at \(sunset)."
    case let .Error(error):
        let serverResponse = "Failure...  \(error)"
}

//: > **Experiment**:
//: > Add a third case to `ServerResponse` and to the switch.
//:
//: Notice how the sunrise and sunset times are extracted from the `ServerResponse` value as part of matching the value against the switch cases.
//:


//: [Previous](@previous) | [Next](@next)
