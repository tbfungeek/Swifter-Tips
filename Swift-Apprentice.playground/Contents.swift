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

// 五.4 值类型和引用类型 【TODO】

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

// 七 方法
// 7.1 标准方法定义(方法名，参数名，返回值类型)
func funcName(param1:Int,param2:Int) -> Void {
    print("This is First Function")
}

// 7.2 标准方法定义
func innerParamNameOutParamName(out inner:String) -> Void {
    print(inner)
}

// 7.3 [参数部分]: 参数的内部名称外部名称
innerParamNameOutParamName(out: "方法可以指定参数内部名称和外部名称")

func ignoreOutParamName(_ inner:String) -> Void {
    print(inner)
}

ignoreOutParamName("方法可以忽略外部外部名称")

// 7.4  [参数部分]: 参数的默认值
func defaultParamValue(param:String="这是一个参数的默认值") -> Void {
    print(param)
}
defaultParamValue()

// 7.5  [参数部分]: inout参数 函数参数是常量，这意味着它们不能被修改。
/*
 func incrementAndPrint(_ value: Int) {
 value += 1 //Left side of mutating operator isn't mutable: 'value' is a 'let' constant
 print(value)
 }*/

func increment(_ value:inout Int) {
    value += 1
}
var valueTobeIncrease = 5
increment(&valueTobeIncrease)
print(valueTobeIncrease)

// 7.6  [可变参数]: 注意Swift中动态参数可以是第一个参数
func dynamicParamFunc(_ dynamicParam:Double...) -> Void {
    print(dynamicParam)
}

dynamicParamFunc(1,2,3,4,5)


// 7.7  [返回值部分]: 基本返回值
func returnValueDemo(param1:Int,param2:Int) -> Int {
    return param1 + param2
}

// 7.8  [返回值部分]: 如果函数只有一条语句并且没有return会以最后一个值作为返回值，如果有多条语句那么就无法享受这个特性，不过一般建议需要添加return
func returnValueDemo1(param1:Int,param2:Int) -> Int {
    //print("param1:\(param1) param2:\(param2)")
    (param1 + param2)
}

// 7.9  [返回值部分]: 通过返回元组返回多个值
func returnTupple(param1:Int,param2:Int) -> (Int,Int) {
    return (param1 + param2,param1 - param2)
}

let (addResult,minusResult) = returnTupple(param1: 3, param2: 4)
print("addResult:\(addResult),minusResult:\(minusResult)")

// 7.10  [方法重载]: 使用单个名称定义类型的函数（方法名称相同，参数数量不同，参数类型不同，外部参数不同，返回值类型不同）
/*
 func printMultipleOf(multiplier: Int, andValue: Int)
 func printMultipleOf(multiplier: Int, and value: Int)
 func printMultipleOf(_ multiplier: Int, and value: Int)
 func printMultipleOf(_ multiplier: Int, _ value: Int)
 */

func getValue() -> Int {
    31
}


func getValue() -> String {
    "Matt Galloway"
}

//注意这里必须表明返回值类型
let valueInt: Int = getValue()
let valueString: String = getValue()

// 7.11  [方法高级部分]: 使用函数或者闭包作为参数或者返回值 [TODO]

// 7.12 [规范化] 代码注释 Option + Cmd + /



// 八. 可选类型：将可选项想象成一个盒子：它要么只包含一个值，要么为空。当它不包含值时，它被称为包含nil. 盒子本身总是存在的；它总是在那里让你打开并看看里面
var authorName: String? = "Matt Galloway"
var authorAge: Int? = 30

// 8.1 [强行展开]

// 在明确知道有值的情况下强行解包
//var unwrappedAuthorName = authorName!

// 如果存在为空的情况下强行解包会发生崩溃
// authorName = nil
// print("Author is \(authorName!)")

// 8.2 [可选绑定]

if let authorName = authorName,
   let authorAge = authorAge {
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age.")
}

// 可以将展开多个选项与额外的布尔检查结合起来
if let authorName = authorName,
   let authorAge = authorAge,
   authorAge >= 40
{
    print("The author is \(authorName) who is \(authorAge) years old.")
} else {
    print("No author or no age or age less than 40.")
}

// 使用 guard 解包
func guardMyCastle(name: String?) {
    guard let castleName = name else {
        print("No castle!")
        return
    }
    // At this point, `castleName` is a non-optional String
    print("Your castle called \(castleName) was guarded!")
}

// 提供默认值
var optionalInt: Int? = 10
var mustHaveResult = optionalInt ?? 0

// 九. 数组

// 9.1 创建数组
var subscribers: [String] = ["one","two","three","four"]
let allZeros = Array(repeating: 0, count: 5)
let upcomingPlayersArray = Array(subscribers[1...2])

// 9.2 访问数组
var currentPlayer = subscribers.first
var firstPlayer = subscribers[0]

// 9.3 遍历数组

// 不需要index
let scores = [2, 2, 8, 6, 1, 2, 1]
for score in scores {
    print(score)
}

// 需要index
for (index,value) in scores.enumerated() {
    print("index = \(index) value = \(value)")
}

// 增加元素
// players.append("Eli")
// players += ["Gina"]
// players.insert("Frank", at: 5)

// 删除元素
// removedPlayer = players.remove(at: 2)

// 更改元素
// players[4] = "Franklin"
// players[0...1] = ["Donna", "Craig", "Brian", "Anna"]

// 查找元素
// subscribers.firstIndex(of: "two")

// 交换元素
// players.swapAt(1, 3)

// 排序
print(scores.sorted(by: >))

// 十. 字典
// 10.1 创建字典
var pairs: [String: Int] = [:]
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]

// 10.2 遍历字典
for (player, score) in namesAndScores {
    print("\(player) - \(score)")
}

for player in namesAndScores.keys {
    print("\(player), ", terminator: "") // no newline
}

for player in namesAndScores.values {
    print("\(player), ", terminator: "") // no newline
}

// 10.3 增加元素
namesAndScores["city"] = 7

// 10.4 更新元素
namesAndScores.updateValue(8, forKey: "name")
namesAndScores["name"] = 8

// 10.5 删除元素
// namesAndScores.removeValue(forKey: "name")
// namesAndScores["name"] = nil

// 10.6 查找元素
if namesAndScores.contains(where: { (key,value) in
    return key == "name"
}) {
    print("contain value with key = \(name)")
} else {
    print("not contain")
}

// 十一. 集合

// 11.1 创建集合
var explicitSet: Set<Int> = [1, 2, 3, 1]
var someSet = Set([1, 2, 3, 1])

// 11.2 增加元素
someSet.insert(5)

// 11.3 删除元素
let removedElement = someSet.remove(1)

// 11.4 判断元素是否存在
someSet.contains(1)

// 十二. 闭包
// 可以用来将代码分解成可重用的块
// 闭包之所以如此命名，是因为它们可以“关闭”闭包范围内的变量和常量。这仅仅意味着闭包可以从周围的上下文中访问任何变量或常量的值。闭包体内使用的变量和常量被认为是被闭包捕获的。
// 没有名字的函数
// 可以将它分配给一个变量并像任何其他值一样传递它

// 12.1 声明
var multiplyClosure: (Int, Int) -> Int

// 12.2 定义
var multiplyClosureDefine = { (a: Int, b: Int) -> Int in
    return a * b
}

// 12.3 简化方案
// 1. 如果闭包由单个 return 语句组成，则可以省略return关键字
multiplyClosure = { (a: Int, b: Int) -> Int in
    a * b
}

// 2. 可以使用 Swift 的类型推断，通过删除类型信息来进一步缩短语法
multiplyClosure = { (a, b) in
    a * b
}

// 3. 可以根据需要省略参数列表。Swift 允许您按编号引用每个参数，从零开始
multiplyClosure = {
    $0 * $1
}

// 12.4 尾随闭包
// 12.5 逃逸闭包
//当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
//当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping ，用来指明这个闭包是允许“逃逸”出 这个函数的。

//一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。
//举个例子，很多启动异 步操作的函数接受一个闭包参数作为 completion handler。
//这类函数会在异步操作开始之后立刻返回，但是闭包 直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调


// 12.6 自动闭包
// 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
// 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。

// 原来模式
var customersInLine = ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: /*这里增加了 @autoclosure*/() -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

func serves(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serves(customer: /*这里删除了{}*/ customersInLine.remove(at: 0))


// 12.5 常用操作
let values = [1, 2, 3, 4, 5, 6]
values.forEach {
    print("\($0) * \($0) = \($0*$0)")
}

var prices = [1.5, 10, 4.99, 2.30, 8.19]
let largePrices = prices.filter {
    return $0 > 5
}
print(largePrices)

let largePrice = prices.first {
    $0 > 5
}
print(largePrice ?? 0)

let salePrices = prices.map {
    $0 * 0.9
}
print(salePrices)

let userInput = ["0", "11", "haha", "42"]
let numbers1 = userInput.map {
    Int($0)
}
print(numbers1)

let numbers2 = userInput.compactMap {
    Int($0)
}
print(numbers2)

let userInputNested = [["0", "1"], ["a", "b", "c"], ["🐕"]]
// 传入的是一个个数组，传出的是一个数组
let allUserInput = userInputNested.flatMap { value in
    //将一个个数组传入
    print(value)
    return value
}
print(allUserInput)

let stock = [1.5: 5, 10: 2, 4.99: 20, 2.30: 5, 8.19: 30]
let stockSum = stock.reduce(0) {
    print("\($0) key = \($1.key) value = \($1.value)")
    return $0 + $1.key * Double($1.value)
}

var priceValues = [1.5, 10, 4.99, 2.30, 8.19]

let firstTwo = prices.prefix(2)
let lastTwo = prices.suffix(2)
print(firstTwo)
print(lastTwo)

let removeFirst = priceValues.dropFirst()
let removeFirstTwo = priceValues.dropFirst(2)
print(removeFirst)
print(removeFirstTwo)

prices.removeAll() { $0 > 2 } // prices is now [1.5]
prices.removeAll()


// 十三. 字符串
let strings = "Matt"

// 13.1 遍历字符
for char in strings {
    print(char)
}

// 13.2 索引
let cafeNormal = "café"
let cafeCombining = "cafe\u{0301}"

let firstIndex = cafeCombining.startIndex
let firstChar = cafeCombining[firstIndex]

let lastIndex = cafeCombining.index(before: cafeCombining.endIndex)
let lastChar = cafeCombining[lastIndex]


let fourthIndex = cafeCombining.index(cafeCombining.startIndex,
                                      offsetBy: 3)
let fourthChar = cafeCombining[fourthIndex]

// 13.3 子串
let fullName = "Matt Galloway"

let indexOfSpace = fullName.firstIndex(of: " ")!

let firstName = fullName[..<indexOfSpace]
print(firstName)
let lastName = fullName[fullName.index(after: indexOfSpace)...]
print(lastName)

// 13.4 翻转
let names = "Matt"
let backwardsName = names.reversed()
let backwardsNameString = String(backwardsName)
print(backwardsNameString)

// 13.5 原始字符串
let raw1 = #"Raw "No Escaping" \(no interpolation!). Use all the \ you want!"#
print(raw1)

let raw2 = ##"Aren’t we "# clever"##
print(raw2)

// 十四. 结构体
// 14.1 结构体是值类型
// 14.2 在定义结构体的时候需要判断某个属性是否后续会发生变化的可能，如果有则声明为var否则声明为let
// 14.3 如果可以在类型初始化时对属性的值做出合理的假设，则可以为该属性赋予默认值。
// 14.4 存储属性和计算属性
// [存储属性] 存储属性有对应的内存用于存储，存储属性可以是常量或变量。可以根据实际需要决定是否需要提供默认值，没有提供默认值的需要在构造方法中进行初始化
// [计算属性] 计算属性必须为变量,计算属性还必须包含一个类型，计算属性还可以有get{} set{} 方法 （一般我们只是给计算属性添加 get set重写）
struct TV {
    var width : Double
    var height: Double
    
    var diagnoal: Int
    {
        let result = (width * width + height * height).squareRoot().rounded()
        return Int(result)
    }
}

var tv = TV(width: 53.93, height: 95.87)
print(tv.diagnoal)


struct TVS {
    var width : Double
    var height: Double
    
    var diagnoal: Int
    {
        get {
            let result = (height * height +
                          width * width).squareRoot().rounded()
            return Int(result)
        }
        set {
            let ratioWidth = 16.0
            let ratioHeight = 9.0
            let ratioDiagonal = (ratioWidth * ratioWidth +
                                 ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
            //注意setter 中没有return声明—它只修改其他存储的属性
        }
    }
}

var c:Int {
    get{
        //这里不论是c还是self.c都会造成crash 原因是方法的死循环，而且 不能像 OC 中 写上 _c
        return 1
        //return self.c 不论是 c 还是 self.c 都会造成 crash  原因是方法的死循环
        //return c 不论是 c 还是 self.c 都会造成 crash  原因是方法的死循环
    }
    set{
        // 我们测试 写上 self.c = newValue 和 不写 都会造成 crash
        // 而且 不能像 OC 中 写上 _c
        //  c = newValue  造成 crash  原因是方法的死循环
        // a = newValue 一般在这里给存储属性赋值
        print("Recived new value", newValue, " and stored into 'A' ")
    }
}

// 14.5 get{} set{} didSet{} willSet{}
// didSet{} willSet{}一般用于监听存储属性的修改，get{} set{} 用于计算属性中
// didSet 属性值改变后触发，willSet 在属性值改变前触发
// willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
// didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
// 属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
// 即使是设置的值和原来值相同，willSet和didSet也会被调用
// get{} set{} / didSet{} willSet{} 不能共存 也就是说 willSet/didSet观察者仅可用于存储的属性。如果您想监听计算属性的更改，只需将相关代码添加到属性的设置器中。

// 14.6 类型属性
struct Level {
    static var highestLevel = 1
    var id: Int
    var boss: String {
        set {
            
        }
        get {
            return "boss value"
        }
    }
    
    var unlocked: Bool = true {
        willSet {
            print("willSet unlocked")
        }
        didSet {
            print("didSet unlocked")
        }
    }
}

var level:Level = Level(id: 23, unlocked: true)
level.unlocked
level.unlocked = false

print(level.unlocked)

// 14.7 懒加载属性（在计算属性前增加lazy，在后面增加()）

struct Circle {
  lazy var pi = {
    ((4.0 * atan(1.0 / 5.0)) - atan(1.0 / 239.0)) * 4.0
  }()
  var radius = 0.0
  var circumference: Double {
    mutating get {
      pi * radius * 2
    }
  }
  init(radius: Double) {
    self.radius = radius
  }
}

// 14.8 初始化器
// 14.9 mutating 方法
// mutating 关键字标记了改变结构值的方法，通过将方法标记为mutating，可以告诉Swift编译器这个方法不能在常量上调用。
// 14.10 类型方法 用static修饰符
struct Math {
  // 1
  static func factorial(of number: Int) -> Int {
    // 2
    (1...number).reduce(1, *)
  }
}
// 3
Math.factorial(of: 6) // 720

// 14.11 通过扩展为结构体添加方法和初始化器

// 十五. 类
// 15.1 类是引用类型
// 15.2 与结构不同，类不自动提供一个成员初始化器
// 15.3 类类型的变量不存储实际实例——它存储对存储实例的内存位置的引用
// 15.4 结构体存储在栈上，类存储在堆上
// 15.5 === 表示是否是同一个对象，== 表示 是否内容相等
// 15.6 类是可变的，结构体是不可变的如果需要改变自身的值需要添加mutating修饰
// 15.7 使用扩展，扩展类添加方法和计算属性，也可以使用继承将功能添加到类中
// 15.8 Swift 中的继承是单继承
// 15.9 多态性与类型转换
// as: 转换为在编译时已知会成功的特定类型
// as?: 尝试性转换，转换失败会返回nil
// as!: 强行转换，转换失败会崩溃

// 十六. 枚举 【TODO】

// 十七. 协议 【TODO】 高级协议 面向协议编程

// 十八. 泛型  【TODO】 高级泛型

// 十九. 访问控制
// 19.1 private 只能被同一个类中，以及扩展中和嵌套类中访问到（不被其他类型）。 private(set) 表示只读属性

protocol Account {
  associatedtype Currency

  var balance: Currency { get }
  func deposit(amount: Currency)
  func withdraw(amount: Currency)
}

typealias Dollars = Double

/// A U.S. Dollar based "basic" account.
class BasicAccount: Account {

  var balance: Dollars = 0.0

  func deposit(amount: Dollars) {
    balance += amount
  }

  func withdraw(amount: Dollars) {
    if amount <= balance {
      balance -= amount
    } else {
      balance = 0
    }
  }
}

class CheckingAccount: BasicAccount {
  private let accountNumber = UUID().uuidString

  class Check {
    let account: String
    var amount: Dollars
    private(set) var cashed = false //private(set)

    func cash() {
      cashed = true
    }

    init(amount: Dollars, from account: CheckingAccount) {
      self.amount = amount
      self.account = account.accountNumber //嵌套类访问外部的私有属性
    }
  }
}

// 19.2 文件私有权限fileprivate：它允许访问与实体在同一文件中编写的任何代码（不被其他文件访问）
// 19.3 internal 表示可以从定义实体的软件模块中的任何位置访问实体
// 19.4 public 表示它的模块外部的代码可以看到和使用的实体。（只能访问）
// 19.5 open 在public的基础上允许覆写改模块的代码（覆写，访问）
// 19.6 将代码组织成扩展，将访问修饰符应用于扩展本身，这将帮助您将整个代码段分类为public、internal或private.
//      当您将访问修饰符应用于扩展时，扩展的所有成员都会获得该访问级别。
// 下私有扩展：
/*
private extension CheckingAccount {
  func inspectForFraud(with checkNumber: Int) -> Bool {
    issuedChecks.contains(checkNumber)
  }

  func nextNumber() -> Int {
    let next = currentCheck
    currentCheck += 1
    return next
  }
}
 //此扩展名标记为private. 扩展将private其所有成员隐式表示为private
*/

// 二十. 自定义运算符
// 20.1 操作符重载
/*
func * (left: String, right: Int) -> String {
  
    if right <= 0 {
        return ""
    }
    var result = left
    for _ in 1..<right {
        result += left
    }
    return result
}

print("a" * 6)
 */
// 20.1 定义操作符的要求：通常最好坚持使用字符/, =, -, +, !, *, %, <, >, &, |,^和?，尽管允许使用许多其他 Unicode 字符。您可能需要经常输入，所以击键越少越好。
// 20.2 precedencegroup定义了一个操作符优先级别
precedencegroup CustomerPrecedence {
  /// 优先从左向右， left, right or none
  associativity: left //associativity 定义了结合律，即如果多个同类的操作符顺序出现的计算顺序。
  higherThan: MultiplicationPrecedence//优先级，比乘法运算高，运算的优先级，乘法运算是优先于加减运算的。除了 higherThan，也支持使用 lowerThan 来指定优先级低于某个其他组。
  // lowerThan: AdditionPrecedence // 优先级, 比加法运算低
  assignment: false // 是否是赋值运算
}

// 20.3 设置优先级
// 继承 CustomerPrecedence 优先级组，也可以继承已有优先级组 AdditionPrecedence等
infix operator **: CustomerPrecedence
// infix 表示要定义的是一个中位操作符，即前后都是输入；其他的修饰子还包括 prefix 和 postfix，感兴趣的可以尝试一下；

// 20.4 在扩展类里写实现，或者自定义类
// 用**运算符定义一个数的平方。
extension Int {
static func ** (lhs: Int, rhs: Int) -> Int {
    return Int(pow(Double(lhs), Double(rhs)))
 }
}
print(10**2)// 100

// 20.5 整体例子
precedencegroup BLCustomerPrecedence {
  /// 优先从左向右， left, right or none
  associativity: left
  //    higherThan: MultiplicationPrecedence//优先级，比乘法运算高
  //    lowerThan: AdditionPrecedence       // 优先级, 比加法运算低
  assignment: false                   // 是否是赋值运算
}

infix operator ~~: BLCustomerPrecedence

extension String {

  static func ~~ (left: String, right: String) -> String {
         return left + right
    }
}
print("12112"~~"~~")

// 二十一. 下标操作

// 21.1 基本定义
/*
 subscript(parameterList) -> ReturnType {
   get {
     // return someValue of ReturnType
   }
  
   set(newValue) {
     // set someValue of ReturnType to newValue
   }
 }
*/
//下标的原型看起来像一个函数的签名：它有一个参数列表和一个返回类型
//下标可能有可变参数并且可以抛出错误但不能使用inout或默认参数。
//下标的主体看起来像一个计算属性：它有一个 getter 和一个 setter。setter 是可选的，因此下标可以是读写的或只读的
//你可以省略setter的newValue默认参数；它的类型与下标的返回类型相同。仅当您想将其名称更改为其他名称时才声明它。

class Person {
  let name: String
  let age: Int

  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

extension Person {
  subscript(key: String) -> String? {
    switch key {
      case "name": return name
      case "age": return "\(age)"
      default: return nil
    }
  }
}

let me = Person(name: "Cosmin", age: 36)
me["name"]
me["age"]
me["gender"]

// 21.2 下标参数
// 调用下标时不必为下标参数使用名称，即使在声明它们时不使用下划线也是如此。
// 如果您想更具体，请添加外部参数名称

/*
subscript(property key: String) -> String? {
  // original code
}

me[property: "name"]
me[property: "age"]
me[property: "gender"]
*/

// 21.3 静态下标
// 可以在 Swift 中为自定义类型定义静态下标

/*
class File {
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
  // 1
  static subscript(key: String) -> String {
    switch key {
      case "path": return "custom path"
      default: return "default path"
    }
  }
}

// 2
File["path"]
File["PATH"]
*/

// 21.4 动态成员查找

// 为类型提供任意点语法
@dynamicMemberLookup
class Instrument {
  let brand: String
  let year: Int
  private let details: [String: String]
  
  init(brand: String, year: Int, details: [String: String]) {
    self.brand = brand
    self.year = year
    self.details = details
  }
  
  // 2
  subscript(dynamicMember key: String) -> String {
    switch key {
      case "info": return "\(brand) made in \(year)."
      default: return details[key] ?? ""
    }
  }
}

// 3
let instrument = Instrument(brand: "Roland", year: 2021,
                            details: ["type": "acoustic",
                                      "pitch": "C"])
instrument.info
instrument.pitch

// 21.5 键路径
// 21.5.1 键路径使您能够存储对属性的引用
class Tutorial {
  let title: String
  let author: Person
  let details: (type: String, category: String)
  
  init(title: String, author: Person,
       details: (type: String, category: String)) {
    self.title = title
    self.author = author
    self.details = details
  }
}

let tutorial = Tutorial(title: "Object Oriented Programming in Swift",
                        author: me,
                        details: (type: "Swift",
                                  category: "iOS"))

let title = \Tutorial.title
let tutorialTitle = tutorial[keyPath: title]

let type = \Tutorial.details.type //为元组使用键路径
let tutorialType = tutorial[keyPath: type]

// 21.5.2 附加键路径
//let authorPath = \Tutorial.author
//let authorNamePath = authorPath.appending(path: \.name)
//tutorialAuthor = tutorial[keyPath: authorNamePath]

// 21.5.3 设置属性
// 键路径可以更改属性值

class Jukebox {
  var song: String
  
  init(song: String) {
    self.song = song
  }
}

let jukebox = Jukebox(song: "Nothing Else Matters")

let song = \Jukebox.song
jukebox[keyPath: song] = "Stairway to Heaven"

// 21.5.4 键路径成员查找

/*
// 1
struct Point {
  let x, y: Int
}

// 2
@dynamicMemberLookup
struct Circle {
  let center: Point
  let radius: Int
  
  // 3
  subscript(dynamicMember keyPath: KeyPath<Point, Int>) -> Int {
    center[keyPath: keyPath]
  }
}

// 4
let center = Point(x: 1, y: 2)
let circle = Circle(center: center, radius: 1)
circle.x
circle.y
*/

// 21.6 键路径作为函数
//如果函数是只有一个参数的闭包并且键路径的返回类型与闭包的返回类型匹配，则可以将键路径用作函数：
let anotherTutorial = Tutorial(title: "Encoding and Decoding in Swift",
                               author: me,
                               details: (type: "Swift",
                                         category: "iOS"))
let tutorials = [tutorial, anotherTutorial]
let titles = tutorials.map(\.title)

// 二十二. 模式匹配
// 模式提供了匹配值的规则
// 可以在if/guard/switch case 以及 while和for
// 22.1 场景 1 if guard

/*
func process(point: (x: Int, y: Int, z: Int)) -> String {
  if case (0, 0, 0) = point {
    return "At origin"
  }
  return "Not at origin"
}

let point = (x: 0, y: 0, z: 0)
let status = process(point: point) // At origin


func process(point: (x: Int, y: Int, z: Int)) -> String {
  guard case (0, 0, 0) = point else {
    return "Not at origin"
  }
  // guaranteed point is at the origin
  return "At origin"
}*/

// 22.2 场景 2 switch

/*
func process(point: (x: Int, y: Int, z: Int)) -> String {
  // 1
  let closeRange = -2...2
  let midRange = -5...5
  // 2
  switch point {
  case (0, 0, 0):
    return "At origin"
  case (closeRange, closeRange, closeRange):
    return "Very close to origin"
  case (midRange, midRange, midRange):
    return "Nearby origin"
  default:
    return "Not near origin"
  }
}

let point = (x: 15, y: 5, z: 3)
let status = process(point: point) // Not near origin
*/

// 22.3 场景 3 for

let groupSizes = [1, 5, 4, 6, 2, 1, 3]
for case 6 in groupSizes {
  print("Found an individual") // 2 times
}

//上面代码每次找出6的时候会进入花括号的代码

// 22.4 场景 4 枚举场景

/*
enum Direction {
  case north, south, east, west
}

let heading = Direction.north

if case .north = heading {
  print("Don’t forget your jacket") // Printed!
}

//------------------------------
enum Organism {
  case plant
  case animal(legs: Int)
}

let pet = Organism.animal(legs: 4)

switch pet {
case .animal(let legs):
  print("Potentially cuddly with \(legs) legs") // Printed: 4
default:
  print("No chance for cuddles")
}

*/

// 22.5 场景 5 非可选匹配
let namess: [String?] =
  ["Michelle", nil, "Brandon", "Christine", nil, "David"]

// 找出非可选的进入
for case let name? in namess {
  print(name) // 4 times
}

// 22.6 场景 6 is 模式

let response: [Any] = [15, "George", 2.0]

for element in response {
 switch element {
 case is String:
   print("Found a string") // 1 time
 default:
   print("Found something else") // 2 times
 }
}

// 22.7 场景 7 as 模式

for element in response {
 switch element {
 case let text as String:
   print("Found a string: \(text)") // 1 time
 default:
   print("Found something else") // 2 times
 }
}

// 22.8 场景 8 where 模式
for number in 1...9 {
  switch number {
  case let x where x % 2 == 0:
    print("even") // 4 times
  default:
    print("odd") // 5 times
  }
}

enum LevelStatus {
  case complete
  case inProgress(percent: Double)
  case notStarted
}

let levels: [LevelStatus] =
  [.complete, .inProgress(percent: 0.9), .notStarted]

for level in levels {
  switch level {
  case .inProgress(let percent) where percent > 0.8 :
    print("Almost there!")
  case .inProgress(let percent) where percent > 0.5 :
    print("Halfway there!")
  case .inProgress(let percent) where percent > 0.2 :
    print("Made it through the beginning!")
  default:
    break
  }
}

struct Rectangle {
  let width: Int
  let height: Int
  let background: String
}

let view = Rectangle(width: 15, height: 60, background: "Green")
switch view {
case _ where view.height < 50:
  print("Shorter than 50 units")
case _ where view.width > 20:
  print("Over 50 tall, & over 20 wide")
case _ where view.background == "Green":
  print("Over 50 tall, at most 20 wide, & green") // Printed!
default:
  print("This view can’t be described by this example")
}

// 22.9 场景 9 用逗号链接
func timeOfDayDescription(hour: Int) -> String {
  switch hour {
  case 0, 1, 2, 3, 4, 5:
    return "Early morning"
  case 6, 7, 8, 9, 10, 11:
    return "Morning"
  case 12, 13, 14, 15, 16:
    return "Afternoon"
  case 17, 18, 19:
    return "Evening"
  case 20, 21, 22, 23:
    return "Late evening"
  default:
    return "INVALID HOUR!"
  }
}
let timeOfDay = timeOfDayDescription(hour: 12) // Afternoon

/*
if case .animal(let legs) = pet, case 2...4 = legs {
  print("potentially cuddly") // Printed!
} else {
  print("no chance for cuddles")
}
 */

// 22.10 场景 10 自定义元组

//将名称和年龄常量组合成一个元组并一起评估它们
/*
let name = "Bob"
let age = 23

if case ("Bob", 23) = (name, age) {
  print("Found the right Bob!") // Printed!
}*/

var username: String?
var password: String?

switch (username, password) {
case let (username?, password?):
  print("Success! User: \(username) Pass: \(password)")
case let (username?, nil):
  print("Password is missing. User: \(username)")
case let (nil, password?):
  print("Username is missing. Pass: \(password)")
case (nil, nil):
  print("Both username and password are missing")  // Printed!
}

// 22.11 通配符规则
// 使用下划线来匹配分量的任何值
// 值绑定，只需在匹配模式时使用varorlet来声明变量或常量
// 如果你想绑定多个值，你可以写let多次，或者更好的是，移动let元组的外部：
/*
 if case (let x, 0, 0) = coordinate {
   print("On the x-axis at \(x)") // Printed: 1
 }
 
 if case let (x, y, 0) = coordinate {
   print("On the x-y plane at (\(x), \(y))") // Printed: 1, 0
 }
*/

// 22.12 模式表达式
// 使用模式匹配运算符比较值~=。当比较返回时匹配成功true
// 如果值是相同的类型，并且实现了Equatable协议，则通用==相等运算符执行比较
// 当值的类型不同或类型未实现Equatable协议时，将~=使用模式匹配运算符
// 模式必须在运算符的左侧，而值必须在运算符的右侧
// 默认情况下～=表示一个整数值是否在一个范围内
let matched = (1...10 ~= 5) // true
// 对于其他情况可以通过重载~=来自定义表达式匹配行为

let list = [0, 1, 2, 3]
let integer = 2

let isInArray = (list ~= integer) // Error!

if case list = integer { // Error!
  print("The integer is in the array")
} else {
  print("The integer is not in the array")
}

// 1
func ~=(pattern: [Int], value: Int) -> Bool {
  // 2
  for i in pattern {
    if i == value {
      // 3
      return true
    }
  }
  // 4
  return false
}


// 二十三. 错误处理 【TODO】

// 23.1 使用Options作为最优先处理策略
// 23.1.1 可失败的初始化器
struct PetHouse {
  let squareFeet: Int
  
  init?(squareFeet: Int) {
    if squareFeet < 1 {
      return nil
    }
    self.squareFeet = squareFeet
  }
}

let tooSmall = PetHouse(squareFeet: 0) // nil
let house = PetHouse(squareFeet: 1)    // Optional(Pethouse)

// 23.1.2 可选链

/*
class Pet {
  var breed: String?

  init(breed: String? = nil) {
    self.breed = breed
  }
}

class Person {
  let pet: Pet

  init(pet: Pet) {
    self.pet = pet
  }
}

let delia = Pet(breed: "pug")
let olive = Pet()

let janie = Person(pet: olive)
let dogBreed = janie.pet.breed! // This is bad! Will cause a crash!
*/


/*
class Toy {
  enum Kind {
    case ball, zombie, bone, mouse
  }

  enum Sound {
    case squeak, bell
  }

  let kind: Kind
  let color: String
  var sound: Sound?

  init(kind: Kind, color: String, sound: Sound? = nil) {
    self.kind = kind
    self.color = color
    self.sound = sound
  }
}

class Pet {

  enum Kind {
    case dog, cat, guineaPig
  }

  let name: String
  let kind: Kind
  let favoriteToy: Toy?

  init(name: String, kind: Kind, favoriteToy: Toy? = nil) {
    self.name = name
    self.kind = kind
    self.favoriteToy = favoriteToy
  }
}

class Person {
  let pet: Pet?

  init(pet: Pet? = nil) {
    self.pet = pet
  }
}

let janie = Person(pet: Pet(name: "Delia", kind: .dog,
                   favoriteToy: Toy(kind: .ball,
                   color: "Purple", sound: .bell)))
let tammy = Person(pet: Pet(name: "Evil Cat Overlord",
                   kind: .cat, favoriteToy: Toy(kind: .mouse,
                   color: "Orange")))
let felipe = Person()

//如果链的任何值是nil，结果也将是nil
if let sound = janie.pet?.favoriteToy?.sound {
  print("Sound \(sound).")
} else {
  print("No sound.")
}
 
*/

// 23.1.3 compactMap 过滤nil

/*
 
 let team = [janie, tammy, felipe]
 let betterPetNames = team.compactMap { $0.pet?.name }

 for pet in betterPetNames {
   print(pet)
 }
 */

// 23.2 使用Error
// 23.2.1 错误协议定义
class Pastry {
  let flavor: String
  var numberOnHand: Int

  init(flavor: String, numberOnHand: Int) {
    self.flavor = flavor
    self.numberOnHand = numberOnHand
  }
}

enum BakeryError: Error {
  case tooFew(numberOnHand: Int), doNotSell, wrongFlavor
  case inventory, noPower
}

// 23.2.2 抛出错误

class Bakery {
  var itemsForSale = [
    "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
    "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
    "Donut" : Pastry(flavor: "Sprinkles", numberOnHand: 24),
    "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
  ]
  
  func open(_ now: Bool = Bool.random()) throws -> Bool {
    guard now else {
      throw Bool.random() ? BakeryError.inventory
                          : BakeryError.noPower
    }
    return now
  }

  func orderPastry(item: String,
                   amountRequested: Int,
                   flavor: String)  throws  -> Int {
    guard let pastry = itemsForSale[item] else {
      throw BakeryError.doNotSell
    }
    guard flavor == pastry.flavor else {
      throw BakeryError.wrongFlavor
    }
    guard amountRequested <= pastry.numberOnHand else {
      throw BakeryError.tooFew(numberOnHand:
                               pastry.numberOnHand)
    }
    pastry.numberOnHand -= amountRequested

    return pastry.numberOnHand
  }
}

// 23.2.3 捕获异常

// 23.2.3.1 详细处理异常

/*
do {
  try bakery.open()
  try bakery.orderPastry(item: "Albatross",
                          amountRequested: 1,
                          flavor: "AlbatrossFlavor")
} catch BakeryError.inventory, BakeryError.noPower {
  print("Sorry, the bakery is now closed.")
} catch BakeryError.doNotSell {
  print("Sorry, but we don’t sell this item.")
} catch BakeryError.wrongFlavor {
  print("Sorry, but we don’t carry this flavor.")
} catch BakeryError.tooFew {
  print("Sorry, we don’t have enough items to fulfill your
         order.")
}
*/

// 23.2.3.2 不处理异常
/*
let open = try? bakery.open(false)
let remaining = try? bakery.orderPastry(item: "Albatross",
                                        amountRequested: 1,
                                        flavor: "AlbatrossFlavor")
*/

// 23.2.3.3 出现错误的时候停止程序
/*
do {
  try bakery.open(true)
  try bakery.orderPastry(item: "Cookie",
                         amountRequested: 1,
                         flavor: "ChocolateChip")
}
catch {
  fatalError()
}
 
 
try! bakery.open(true)
try! bakery.orderPastry(item: "Cookie", amountRequested: 1,
                     flavor: "ChocolateChip")

 */

// 23.2.3.4 重新抛出错误

/*
 func perform(times: Int, movement: () throws -> ()) rethrows {
   for _ in 1...times {
     try movement()
   }
 }
 */
//rethrows表示它只会重新抛出传递给它的闭包抛出的错误，它永远不会抛出它自己的错误。

// 23.2.4 可抛出属性与下标

/*
// 1
class Person {
  var name: String
  var age: Int
  
  init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
}

// 2
enum PersonError: Error {
  case noName, noAge, noData
}

// 3
extension Person {
  var data: String {
    get throws {
      guard !name.isEmpty else {throw PersonError.noName}
      guard age > 0 else {throw PersonError.noAge}
      return "\(name) is \(age) years old."
    }
  }
}
 */

/*
let me = Person(name: "Cosmin", age: 36)

me.name = ""
do {
  try me.data
} catch {
  print(error) // "noName"
}

me.age = -36
do {
  try me.data
} catch {
  print(error) // "noName"
}

me.name = "Cosmin"
do {
  try me.data
} catch {
  print(error) // "noAge"
}

me.age = 36
do {
  try me.data // "Cosmin is 36 years old."
} catch {
  print(error)
}
 */

/*
 
 extension Person {
   subscript(key: String) -> String {
     get throws {
       switch key {
         case "name": return name
         case "age": return "\(age)"
         default: throw PersonError.noData
       }
     }
   }
 }

 do {
   try me["name"] // "Cosmin"
 } catch {
   print(error)
 }

 do {
   try me["age"] // "36"
 } catch {
   print(error)
 }

 do {
   try me["gender"]
 } catch {
   print(error) // "noData"
 }
 
 */

// 二十四. 内存管理 【TODO】

// 二十五. 并发 【TODO】
































