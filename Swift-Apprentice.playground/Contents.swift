import UIKit

var greeting = "Hello, playground"


// 一. 注释

// 单行注释

/*
 这是一个
 多行
 注释
 */

/* 这是一个嵌套注释的外层
 /*
  这是一个嵌套注释的内层
  */
 */


// 二. 打印

print("Hello Swift Apprentice reader!")

// 三. 运算符
// 算术运算符: + - * / %
// 关系运算符: == != > < >= <=  === !==
// 位运算: & | ~ ^ >> <<
// 逻辑运算符: ! &&  ||
// 赋值运算符: ==
// 三目运算符: ?:
// 空合运算符: a??b
//           a必须是option类型
//           ?? 两边一定要有空格
//           a和b对存储类型必须保持一致
//           对可选类型进行空判断，如果包含一个值就进行解封，否则就返回一个默认值b
// 区间运算符: 闭区间 a...b
//           开区间 a..<b

// 四. 常量变量
// 常量:
let number: Int = 10
// 一旦你声明了一个常量，你就不能改变它的数据 number = 0
// 数值进制:
// 十进制，没有前缀
// 二进制，前缀为0b
// 八进制，前缀为0o
// 十六进制，前缀为0x

// 随机值
Int.random(in: 0...5)

// 变量:
var variableNumber: Int = 42
// 类型: 类型描述了一组值以及可以对它们执行的操作
// Swift 不允许您将一种类型的值分配给另一种类型,如果要将一种类型赋给另一种类型，必须通过显式转换类型

/*
 var integer: Int = 100
 var decimal: Double = 12.5
 // 会提示错误
 integer = decimal
 // 强制类型转换
 integer = Int(decimal)
 
 let hourlyRate: Double = 19.5
 let hoursWorked: Int = 10
 // 这里也会提示错误
 let totalCost: Double = hourlyRate * hoursWorked
 // 指明类型
 let totalCost: Double = hourlyRate * Double(hoursWorked)
 */

// 类型推断:
let typeInferredInt = 42

// 五. 类型

// 五.1 字符与字符串：
let char:Character = "a"
let string:String = "this is a string"

// 连接字符串
var message = "Hello"
var name = " tbfungeek"
message += name
print(message)

// 插值
var age = 29
var sayHello = "Hello my Name is tbfungeek, I am \(age) years old"
print(sayHello)

// 多行字符串
// 多行字符串的前导空格等于最后的"""距离字符串的空格个数
let bigString = """
  You can have a string
  that contains multiple
  lines
  by
  doing this.
"""
print(bigString)

let bigString1 = """
You can have a string
that contains multiple
lines
by
doing this.
"""
print(bigString1)

// 五.2 元组
// 匿名元组
let coordinates: (Int, Int) = (2, 3)

print(coordinates.0)
print(coordinates.1)

// 命名元组
let coordinatesNamed = (x: 2, y: 3)

print(coordinatesNamed.0)
print(coordinatesNamed.1)

print(coordinatesNamed.x)
print(coordinatesNamed.y)

// 解包
let (x, y) = coordinatesNamed
print(x)
print(y)

let coordinates3D = (x: 2, y: 3, z: 1)
let (dx,dy,_) = coordinates3D

print(dx)
print(dy)

// 五.3 集合类型

// 六 类型别名
typealias AnimalName = String
var dogName: AnimalName = "didi"
print(dogName)

// 七 控制符

// while() {} / repeat {} while

// for in
// for index in 1...6
// for _ in 1..< 8
// for (key,value) in maps

// if
// switch
// 1. 基本用法：不需要break
//    当匹配的 case 分支中的代码执行完毕后，程序会 终止 switch 语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用 break 语句
//    fallthrough
//    fallthrough关键字不会检查它下一个将会落入执行的case中的匹配条件。fallthrough简单地使代码继续连接到下一个 case 中的代码(注意：是下一个，不是整个)
// 2. 多个case相同处理: case 0,1,2,3,4,5:             [合并匹配]
// 3. 使用范围匹配: case 0...5:                       [范围匹配]
// 4. 使用let where匹配: case let x where x % 2 == 0 [取值条件匹配]

func isOdd(number:Int) -> Bool {
    switch (number) {
    case let x where x % 2 != 0:
        return true
    default: return false
    }
}

print(isOdd(number: 34))

func location(coordinates:(Int,Int,Int)) {
    switch coordinates {
    case let (x, y, _) where y == x:
        print("Along the y = x line.")
    case let (x, y, _) where y == x * x:
        print("Along the y = x^2 line.")
    default:
        break
    }
}
location(coordinates: (10,10,34))
location(coordinates: (10,100,34))

// 5. 部分匹配:
//    需要固定匹配的内容写死，不需要匹配的可以通过let取值或者通过_忽略，还可以通过let where 对let取值部分进行进一步匹配
let coordinate = (x: 3, y: 2, z: 5)
switch coordinate {
case (0, 0, 0): // 1
    print("Origin")
case (_, 0, 0): // 2
    print("On the x-axis.")
case (0, _, 0): // 3
    print("On the y-axis.")
case (0, 0, _): // 4
    print("On the z-axis.")
default:        // 5
    print("Somewhere in space")
}

switch coordinate {
case (0, 0, 0):
    print("Origin")
case (let x, 0, 0):
    print("On the x-axis at x = \(x)")
case (0, let y, 0):
    print("On the y-axis at y = \(y)")
case (0, 0, let z):
    print("On the z-axis at z = \(z)")
case let (x, y, z):
    print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}


// 6. 控制转移语句: break, continue
let value = 23

switch value {
case let x where x > 20:
    print(x)
    fallthrough
case 23:
    print(value)
default:
    print("default")
}

// 7. guard 语句
// 与if语句相同的是，guard也是基于一个表达式的布尔值去判断一段代码是否该被执行。与if语句不同的是，guard只有在条件不满足的时候才会执行这段代码。
// 在使用它的时候默念 保证guard后面的语句执行没问题，否则执行else
/*
guard let item = inventory[name] else {
    throw VendingMachineError.InvalidSelection
}
*/

// 8. where 语句 [TODO]




















