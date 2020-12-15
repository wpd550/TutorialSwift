
//

import SwiftUI

var range:ClosedRange = 0...3
print(range)
print(range.upperBound)
print(range.lowerBound)
print(range.contains(0))
print(range.contains(3))

//属性包装器
//@propertyWrapper
//struct Clamping<Value:Comparable>
//{
//    var value: Value
//    let range:ClosedRange<Value>
//    //必须实现的方法
//    var wrappedValue:Value{
//        get{
//            value
//        }
//        set{
//            value = min(max(range.lowerBound, newValue), range.upperBound)
//        }
//    }
//    init(_ range:ClosedRange<Value>,_ value:Value) {
//        self.value = value
//        self.range = range;
//    }
//    init(initiaVatlue value: Value,_ range:ClosedRange<Value>) {
//        precondition(range.contains(value))
//        self.value = value
//        self.range = range
//    }
//}
//
//struct Solution{
//    @Clamping(0.0...14.0) var pH: Double
//}
//
//let carbonicAcid = Solution()


@propertyWrapper
struct Clamping<Value: Comparable> {
    var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue: Value,_ range: ClosedRange<Value>) {
        precondition(range.contains(wrappedValue))
        self.value = wrappedValue
        self.range = range
    }

    var wrappedValue: Value {
        get { value }
        set { value = min(max(range.lowerBound, newValue), range.upperBound) }
    }
}

struct Solution {
    @Clamping(0...14) var pH: Double = 1.0
}

let carbonicAcid = Solution(pH: 4.68) // 在标准情况下为 1 mM


@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }

    init() {
        maximum = 12
        number = 0
    }
    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct ZeroRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int
}

var zeroRectangle = ZeroRectangle()
print(zeroRectangle.height, zeroRectangle.width)
struct MixedRectangle {
    @SmallNumber var height: Int = 1
    @SmallNumber(maximum: 9) var width: Int = 2
}

var mixedRectangle = MixedRectangle()
print(mixedRectangle.height)
// 打印 "1"


//去除首位空格属性包装器
//
@propertyWrapper
struct Trimmed{
    private(set) var value:String = ""
    var wrappedValue:String{
        get{
            value
        }
        set{
            value = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    init(wrappedValue value:String) {
        //初始化不会掉用wrappedValue
//        self.value = value
        self.wrappedValue = value
    }
}

struct Post{
    @Trimmed var title:String
    @Trimmed var body:String
}

let quine = Post(title:  "      swift", body: "       dd ")
print(quine.title)
print(quine.body)


var str:String = "AbvD"

print(str.caseInsensitiveCompare("abvd") == .orderedSame)

@propertyWrapper
struct CaseInsensitive<Value:StringProtocol>
{
    var wrappedValue:Value
}

CaseInsensitive(wrappedValue: "hello")
