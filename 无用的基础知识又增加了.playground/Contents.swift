import Cocoa


//函数

func add( a:Int,b:Int)->Int{
    return a + b
}


print(add(a: 10, b: 5))

// 无名参数

func printHello()->String{
    print("hello")
    return "hello"
}

printHello()

// 多参数函数
func greet(_ person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return person + "alreadyGreeted"
    } else {
        return person + "hello"
    }
}
print(greet("Tim", alreadyGreeted: true))

// 无返回值
func greet(person:String)
{
    print("Hello, \(person)!")
}
greet(person: "Dave")

//多重返回值函数

func minMax(array : [Int])->(min:Int,max:Int)
{
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)

}
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

// 可选元组返回类型

func min2Max(array:[Int])->(min:Int,max:Int)?
{
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let bounds = min2Max(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
}

// 隐式返回的函数
//如果一个函数的整个函数体是一个单行表达式，这个函数可以隐式地返回这个表达式

func greeting(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greeting(for: "Dave"))

//只能参数标签

func greet(person:String,from hometown:String)->String
{
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
print(greet(person: "Bill", from: "Cupertino"))

// 忽略参数标签
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
     // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
someFunction(1, secondParameterName: 2);

// 默认参数

func someFunction1(parameterWithoutDefault:Int,paremeterWithDefault:Int = 12)
{
    print("parameterWithoutDefault = \(parameterWithoutDefault)\n  paremeterWithDefault = \(paremeterWithDefault)")
}
someFunction1(parameterWithoutDefault: 12)

someFunction1(parameterWithoutDefault: 11, paremeterWithDefault: 12)

// c++ 默认参数必须放在最后，swift 不用
func someFunction2(paramater1: Int, paramater2:Int = 1,parameter3: Int)
{
    print("parameter1 = \(paramater1)\n  parameter2 = \(paramater2)\n parameter3 = \(parameter3)")
}
someFunction2(paramater1: 11,  parameter3: 9);



//可变参数
//一个可变参数（variadic parameter）可以接受零个或多个值。函数调用时，你可以用可变参数来指定函数参数可以被传入不确定数量的输入值。通过在变量类型名后面加入（...）的方式来定义可变参数。
//可变参数的传入值在函数体中变为此类型的一个数组。例如，一个叫做 numbers 的 Double... 型可变参数，在函数体内可以当做一个叫 numbers 的 [Double] 型的数组常量。
//下面的这个函数用来计算一组任意长度数字的 算术平均数（arithmetic mean)：

func arithmeticMean(_ numbers:Double...)->Double
{
    var total:Double = 0;
    for number in numbers
    {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(1, 2, 3, 4, 5))
print(arithmeticMean(3, 8.25, 18.75))

//输入输出参数

func swapTwoInts(_ a : inout Int,_ b: inout Int)
{
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

//函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFucntion:(Int,Int)->Int = addTwoInts

print(mathFucntion(10,12))

//函数类型作为参数类型

func printMathResult(_ mathFunction:(Int,Int)->Int,_ a:Int,_ b:Int)
{
    print("Resulte: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 1, 3)

//函数类型作为返回类型

func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}


// 嵌套函数


func chooseStepFunction1(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction1(backward: currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// 结构体和类
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

let vga = Resolution(width: 1080, height: 760)

//属性
//存储属性
//简单来说，一个存储属性就是存储在特定类或结构体实例里的一个常量或变量。存储属性可以是变量存储属性（用关键字 var 定义），也可以是常量存储属性（用关键字 let 定义）
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

//常量结构体实例的存储属性
//如果创建了一个结构体实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使被声明为可变属性也不行:

class Demo{
    var name:String = "小米";
}

struct StructDemo
{
    var classValue:Demo = Demo()
}

let demo = StructDemo()
demo.classValue.name = "小明"
print(demo.classValue.name)

var classDemo1 = Demo()
//demo.classValue = classDemo1

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// 该区间表示整数 0，1，2，3
//rangeOfFourItems.firstValue = 6

//延时加载存储属性
class DataImporter {
    /*
    DataImporter 是一个负责将外部文件中的数据导入的类。
    这个类的初始化会消耗不少时间。
    */
    var fileName = "data.txt"
    // 这里会提供数据导入功能
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // 这里会提供数据管理功能
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// DataImporter 实例的 importer 属性还没有被创建
print(manager.data)

//由于使用了 lazy，DataImporter 的实例 importer 属性只有在第一次被访问的时候才被创建。比如访问它的属性 fileName 时：

//计算属性
//除存储属性外，类、结构体和枚举可以定义计算属性。计算属性不直接存储值，而是提供一个 getter 和一个可选的 setter，来间接获取和设置其他属性或变量的值。

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            print("get")
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            print("set")
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

//只读计算属性
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
var fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
//fourByFiveByTwo.volume = 30;


//属性观察
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("将 totalSteps 的值设置为 \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("增加了 \(totalSteps - oldValue) 步")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// 将 totalSteps 的值设置为 200
// 增加了 200 步
stepCounter.totalSteps = 360
// 将 totalSteps 的值设置为 360
// 增加了 160 步
stepCounter.totalSteps = 896
// 将 totalSteps 的值设置为 896
// 增加了 536 步



//属性包装器
@propertyWrapper struct TwelveOrLess{
    private var number:Int
    init() {
        self.number = 0
    }
    //要实现这个属性
    var wrappedValue:Int{
        get { number}
        set { number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}
var rectangle = SmallRectangle()
print(rectangle.height)
// 打印 "0"

rectangle.height = 10
print(rectangle.height)
//// 打印 "10"
//
rectangle.height = 24
print(rectangle.height)



//设置被包装属性的初始值

@propertyWrapper
struct SmallNumber{
    private var maximum:Int
    private var number:Int
    
    var wrappedValue:Int{
        get{ number}
        set{ number = min(newValue, maximum)}
    }
    
    init() {
        print("init")
        maximum = 12
        number = 0
    }
    
    init(wrappedValue:Int) {
        print("wrappedValue:Int")
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue:Int,maximum:Int) {
        print("wrappedValue:Int,maximum:Int")
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct UnitRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber var width: Int = 1
}


var unitRectangle = UnitRectangle()
print(unitRectangle.height, unitRectangle.width)




struct NarrowRectangle {
    @SmallNumber(wrappedValue: 2, maximum: 5) var height: Int
    @SmallNumber(wrappedValue: 3, maximum: 4) var width: Int
}

var narrowRectangle = NarrowRectangle()
print(narrowRectangle.height, narrowRectangle.width)
// 打印 "2 3"

narrowRectangle.height = 100
narrowRectangle.width = 100
print(narrowRectangle.height, narrowRectangle.width)
// 打印 "5 4"

@propertyWrapper class SmallNumber1{
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
class  SomeStructure {
    @SmallNumber1 var someNumber: Int
}
var someStructure = SomeStructure()
someStructure.someNumber = 4;


print(someStructure.$someNumber)
print(someStructure.someNumber)

someStructure.someNumber = 55
print(someStructure.$someNumber)
print(someStructure.someNumber)




















































//结构体和枚举是值类型

//类是引用类型

//swift 杂谈

// 为啥swift 将 string array dictiong 等作为值类型而不是引用类型？

/*
    Swift 是一种多范式的编程语言。它有类，这是构成面向对象编程的基石。类在 Swift 中可以定义属性和方法，指定构造器，符合协议，支持集成和多态。Swift 也是一种面向协议的编程语言，通过功能丰富的协议和结构体，可以在没有继承的情况下实现抽象和多态。在 Swift 中，函数是第一类型，它可以赋给变量，作为参数和返回值在多个函数之间传递。因此 Swift 也适用于函数式编程。
    对于多数面向对象语言的开发者来说，Swift 中最大的不同就是结构体的丰富功能。除了继承以外，你在一个类里可以做什么，在结构体中同样可以做到。这就引发了问题 —— 何时并如何使用结构体和类。更通俗的说，问题是在 Swift 中何时并如何使用值类型和引用类型。
    为了完整需要提醒一下，Swift 中的值类型并不仅仅只有结构体。枚举和元组也是值类型。同样地，引用类型并不只有类，函数也是引用类型。不过函数、枚举和元组在使用时更加特定化。Swift 在值类型和引用类型的争论中心都集中在结构体和类上。这是本文中的主要重点，所以在本文中术语值类型和引用类型可以和术语结构体和类相互转换。
 */




// string 值类型的读时共享，写是复制？

var string1:String = "123"
var string2:String = string1

withUnsafePointer(to: &string1) {
    print("string1 addr : \($0)")
}

withUnsafePointer(to: &string1) {
    print("string2 addr : \($0)")
}


string1 += "4"
print(string1)
print(string2)

withUnsafePointer(to: &string1) {
    print("\($0)")
}

withUnsafePointer(to: &string2) {
    print("\($0)")
}




// 可选类型

/*
  我们都知道，在oc中 nil 表示一个指向不存在的对象的指针。而在swift 中，nil 不是指针，而是一个确定的值，它表示一切值缺失的情况。
 
 而在swift中，变量分为可选类型和非可类型。可选类型的变量可以有值，也可以无值，无值的变量取值得到的就是nil，相对应的，非可选类型的变量必须有值，也不能赋值为nil，如果没有值就会报编译期错误。Swift 声明一个变量时默认情况下就是非可选的，即必须给这个变量赋值一个非空值。之所以引入可选类型和非可选类型是为了增强安全检查，对于因 nil 引发的崩溃可以在编译期就检查出来，避免崩溃发现时间延时到运行时。
 
 
 
 */
 
var optionalVariable:String? = nil

var noOptionlVariable:String
noOptionlVariable = "123"
optionalVariable = noOptionlVariable
print(noOptionlVariable)

// 可选链
/*
 1. 概念：
 
 
 
 */



class Residence{
    var numberOfRooms = 1
}
class Person{
    var residence : Residence?
}

let person = Person()

if let roomCount = person.residence?.numberOfRooms{
    print("person")
    
}else
{
    print("NOthing")
}



enum  SomeEnumeration{
    case north
    case south
    case east
    case west
}

enum SomeEnumeration1
{
    case north,south,east,west
}

print(SomeEnumeration.east)
print(SomeEnumeration1.east)

var somethingType = SomeEnumeration.west

somethingType = .south


enum Beverage:CaseIterable
{
    case coffee,tea,juice
}

print(Beverage.allCases)

for beverage in Beverage.allCases
{
    print(beverage)
}



enum VendingMachineError:Error{
    case invalidSelection
    case insufficientFunds(coinsNeeded:Int)
    case outOfstock
}


throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

