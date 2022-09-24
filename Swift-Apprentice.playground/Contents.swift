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


// 十六. 枚举

// 十七. 协议

// 十八. 泛型

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


































