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









