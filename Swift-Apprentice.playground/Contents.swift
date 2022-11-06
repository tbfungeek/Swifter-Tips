import UIKit

// ReadNote of https://www.raywenderlich.com/books/swift-apprentice
// Materials https://github.com/raywenderlich/sa-materials/tree/editions/7.0
// Swift GG https://swiftgg.gitbook.io/swift/swift-jiao-cheng/01_the_basics


// Swift 总结
// 一. 注释
// 单行注释(Command + /)。多行注释，嵌套注释，Doc注释(Command + Option + /)
//MARK: - 标注
//TODO: - TODO

// 二. 打印
// print VS debugPrint(会带上类型等信息)

// 三. 运算符号
// 1. 算术，关系，逻辑，赋值，位运算，三目赋值
// 2. 比较特殊的运算符号: === !==
//    (左值是可选变量)??（右值是备选对象）
//    ... ..<

// 四. 常量与变量
// 1. 类型推断
// 2. 强制类型转换
// 3. 常量的定义与二进制，十进制，八进制，十六进制表示 [BOX]
// 4. 变量

// 五. 常用类型
// 0. 类型别名typealias
// 1. 值类型和引用类型：从存储位置，赋值行为对二者进行对比，什么是COW
// 2. 字符串常见操作： +  \()  """  """" #/## startIndex,endIndex,index/firstIndex/ .../..<
// 3. 元组: 定义，匿名元组，命名元组，解包，解包忽略某些成员
// 4. 数组：定义，访问，遍历（需要index(enumerated),不需要index），增，删，改，查，排序，交换
// 5. 字典: 定义，访问，遍历 (需要key，不需要key)，增，删，改，查
// 6. 集合: 定义，访问，遍历，增，删除，查

// 六. 控制语句
// 1. while() {}/ repeat{} while()
// 2. for index in range / for _ in range /for (key,value) in map
// 3. switch 合并匹配，访问匹配，取值条件匹配，部分匹配 [TODO]
// 4. break,continue,return,fallthrough
// 5. guard
// 6. where  [TODO]
// 7. 模式匹配 [TODO]
// a. if case/guard case/switch case + 元组/枚举 判断是否是某个案例 [TODO]
// b. switch case/let where (如果变量直接来自switch变量则直接case _ where xxxx) [TODO]
// c. 模式表达式 [TODO]
// d. 模式匹配通配符_ 准确值 值绑定 [TODO]

// 七. 方法
// 1. func 方法名称(外部标签 内部标签:inout 类型=默认值...(可变参数)) -> (类型，元组) (5个元素，并且在类型左右有inout,..)
// 2. 方法重载：参数类型，参数数量，参数外部标签，返回值类型
// 3. 将方法和闭包作为参数或者返回值
// 4. 类方法static
// 5. 结构体mutating方法
// 总结 static/mutating func(outTag innerTag:inout String...,方法/类型/元组) -> 方法/类型/元组
//     参数类型，参数数量，参数外部标签，返回值类型

// 八. 可选类型
// 1. 一个定时炸弹盲盒,定义
// 2. 强制打开，if let/guard let/
// 3. 提供备用值 ??

// 九. 闭包
// 9.1 匿名，捕获上下文常量变量
// 9.2 闭包定义
// 9.3 闭包简化方案 return/参数类型/参数/in/$0
// 9.4 尾随闭包
// 9.5 逃逸闭包
// 9.6 自动闭包: 适合类型：无参数，返回值可有可无，传入表达式，延迟求值

// 十. 函数式编程
// 10.1 forEach/filter/map/compactMap/flatMap/reduce[函数编程6君子]

// 十一. 面向对象

// 十一. 1 基本概念
// 11.0 类与结构体枚举的区别 （结构：值，栈/类: 引用，堆）==/===

// 十一. 2 属性
// 11.2.1 存储属性（类和结构体），计算属性（类，结构，枚举，扩展）[TODO 接口中可以吗]
// 11.2.2 存储属性可以是let 常量，var变量，默认值，如果没有默认值则在初始化函数中对其进行赋值，它可以有didSet(oldValue)和willSet(newValue)属性监听器
// 11.2.3 计算属性只能是变量，可以有set和get
// 11.2.4 懒加载属性 layzy var value = {}()
// 11.2.5 类属性 static
// 11.2.6 propertyWrapper属性包装器（用于限定属性）
//        (0) @propertyWrapper修饰结构体（1）私有属性 (2)计算属性wrappedValue （3）projectedValue （4）init(wrappedValue) (5)$获取projectedValue
//        (6) 参数，通用

// 十一. 3 方法
// 11.3.0 方法包括初始化方法，一般方法，mutating方法，静态方法，析构方法，下标，操作符
// 11.3.1 初始化方法：
//        (0) 初始化方法必须保证在使用之前全部的存储属性得到初始化
//        (1) 【 自动成员初始化器 】结构体有自动成员初始化器，但是一旦声明一个其他初始化器自动初始化器就会失效，但是如果在扩展中声明初始化器不会导致自动成员初始化器消失，类没有自动成员初始化器
//        (2) 【 无参初始化器 】可以通过两种方式获得无参初始化器：在类属性定义的过程中指定全部存储属性的默认值，在初始化器中指定默认值
//        (3) 【 必需初始化器 】子类必须提供该类型的初始化器，但是可以不用override来标识，对于convenience初始化方法也可以加上 required以确保子类对其进行实现。
//        (4) 【 指定初始化器 】调用直接父类的初始化器
//        (5) 【 便利初始化器 】调用自己的其他初始化器，可以是指定，也可以是便利，但是最终都需要调用到指定初始化器
//        (6) 【 可失败初始化器 】可能失败的初始化器
// 11.3.2 初始化过程：
//        (0) 两步初始化 1. 先初始化当前类新增加的 2. 准备初始化父类需要的变量，调用super 初始化方法 3. 这时候就可以调用self的方法和变量了
//        (1) 指定初始化程序必须从其【直接超类】调用指定初始化程序。 便利构造器必须从同一个类中调用另一个构造器，便利构造器最终必须调用指定构造器
// 11.3.3 一般方法：
// 11.3.4 mutating方法：不适用于类，只适用于结构体和枚举，修改自身值的时候不用mutating，不能用于常量
// 11.3.5 静态方法: static 开头
// 11.3.6 析构方法: deinit
// 11.3.7 下标方法
//        * 下标分成: 对象下标方法/静态下标方法
//        * 原型和函数类似，包含一个参数列表和一个返回值
//        * 参数列表可以是可变参数，可以抛出错误，可以是异步/但是不能是inout和默认参数
//        * 下标的主体看起来像一个计算属性，由一个get和一个set构成，set是可选的。
// 11.3.8 动态成员
//        * 动态成员 @dynamicMemberLookup/dynamicMember 通过下标操作为对象添加动态成员
// 11.3.9 键路径
//        * 设置类的属性/访问类的属性/作为参数 使用方法\.类型.xxx tutorial[keyPath:

/*
class Personal {
    var name = "nameX"
}

let personal = Personal()
let name = personal[keyPath: \.name]
personal[keyPath: \.name] = "afterChange"
*/

// 11.3.10 自定义操作符
// https://abhimuralidharan.medium.com/how-to-create-a-custom-operator-like-operator-in-swift-55953c0c0bf2
// https://docs.swift.org/swift-book/LanguageGuide/AdvancedOperators.html#//apple_ref/doc/uid/TP40014097-CH27-ID41
// https://developer.apple.com/documentation/swift/operator-declarations
/*
    precedencegroup BLCustomerPrecedence {
      /// 优先从左向右， left, right or none
      associativity: left
      //    higherThan: MultiplicationPrecedence//优先级，比乘法运算高
      //    lowerThan: AdditionPrecedence       // 优先级, 比加法运算低
      assignment: false                   // 是否是赋值运算
    }
 
    /*
     Infix — Used between two values (ex: <value>+<value>)
     Prefix — Used before a value (ex: !<value>)
     Postfix — Used after a value (ex: <value>!)
    */
 
    infix operator ~~: BLCustomerPrecedence
    extension String {
      static func ~~ (left: String, right: String) -> String {
             return left + right
        }
    }
*/

// 十一. 4 继承与多态
// 11.4.0 单继承 super override
// 11.4.1 final 类不允许继承/方法不允许覆写
// 11.4.2 多态 as/as?/as! if let as
//        if people is Man {} / if let m = people as? Man {}

// 十一. 5 枚举
// 11.5.1 枚举定义，指定类型
// 11.5.2 原始值，指定，访问，使用原始值来初始化枚举
// 11.2.3 关联值定义，赋值，取值
// 11.2.4 枚举遍历
// 11.2.5 一个枚举值不能既有关联值又有原始值

// 十二. 协议
// 12.1 协议的能（约束行为）与不能（实例化对象）
// 12.2 协议包含的元素：
//                   属性{必须有get，set修饰，遵循方var还是let 是由get/set决定的，最小标准原则，可以是计算属性或者存储属性}，
//                   初始化器{必须有require修饰}
//                   方法{不能包含默认值}，
//                   协议与关联类型 {associatedtype,typealias}
//                   协议继承
//                   只允许类遵循的协议 (AnyObject)
//
// 12.3 协议可以被类，结构体，枚举，扩展遵循
// 12.4 遵循多个协议，协议组合
// 12.5 常见协议
//      Equatable/Comparable/Hashable/Identifiable/CustomStringConvertible/CustomDebugStringConvertible
//      CaseIterable/Codeble/CodingKeys
//
// 12.6 协议扩展：【提供默认实现和携带方法给遵循者】
//      可以扩展协议，来提供默认实现，协议遵循方还可以提供自己的实现，自己的实现会覆盖默认的实现
//      协议扩展中可以使用协议中的其他成员
//      协议扩展中还可以提供一些已经实现好的方法供协议实现方使用
//
// 12.7 协议约束: 【使用某个协议中的方法，要同时满足两个协议才能遵循】
//      在协议扩展上使用类型约束，您可以使用该类型的方法和属性,通过类型约束可以同时使用两个类型的属性和方法，以及在特定类型上创建默认实现
//      whare Self:协议A
//      协议约束的好处 1.可以使用协议A中的方法 2.指定只有同时实现这两个协议的类才可以使用这个扩展中的方法

/*
protocol ProtocolA {
    func test()
}
 
protocol Test {
}

extension Test where Self:ProtocolA{
    func sayHello() {
        test() //可以使用ProtocolA的方法
        print("sayHello")
    }
}

class TestIMP:Test {
    func testFunc() {
        sayHello() //不能使用因为没有实现ProtocolA
    }
}

let test = TestIMP()
test.testFunc()
*/

// 十三. 泛型
// 修饰类，修饰方法参数
// 泛型中的类型约束
// 类型擦除隐藏有关具体类型的不重要细节，但仍使用协议传达类型的功能。
// 不透明类型：又称为反向泛型，被调用方知道具体的类型细节，调用方不知道调用细节，只知道返回协议所暴露的，
//           泛型是被调用方只实现通用的细节，但是具体的类型细节它不知道，而调用方知道它所需要的类型细节信息。
// 如果具有不透明返回类型的函数从多个位置返回，则所有可能的返回值必须具有相同的类型。
// 还可以将值作为实现协议组合的对象返回
// 所有的操作都必须是基于所暴露的协议来完成的

// 十四. 扩展
// 14.1 扩展不但可以针对类,结构体，枚举，还可以这对协议创建扩展（添加协议的默认实现）【适用对象: 类，结构体，枚举，协议】
// 14.2 使用扩展，扩展类添加方法和计算属性和初始化器，但是不能添加存储属性，因为这会改变结构的大小和内存布局并破坏现有代码。 【不能添加存储属性，可以添加计算属性，初始化器，方法】
//      通过在扩展中添加自己的初始化程序，可以为结构保留编译器的成员初始化程序
// 14.3 使用扩展遵循的优点是，可以将协议采用与必要的方法和属性很好地分组，而不是让一堆协议使您的类型定义变得混乱。【作用：实现分组】
// 14.4 Swift 允许为某些采用类型编写扩展。在协议扩展上使用类型约束，您可以使用该类型的方法和属性。
// 14.5 将代码组织成扩展，将访问修饰符应用于扩展本身，这将帮助您将整个代码段分类为public、internal或private.当您将访问修饰符应用于扩展时，扩展的所有成员都会获得该访问级别。【添加访问控制】

// 十五. 访问控制
// 15.1 private 只能被同一个类中，以及扩展中和嵌套类中访问到（不被其他类型）
//      private(set) 表示只读属性
// 15.2 文件私有权限fileprivate：它允许访问与实体在同一文件中编写的任何代码（不被其他文件访问）
// 15.3 internal 表示可以从定义实体的软件模块中的任何位置访问实体
// 15.4 public 表示它的模块外部的代码可以看到和使用的实体。（只能访问）
// 15.5 open在public的基础上允许覆写改模块的代码（覆写，访问）
// 15.6 将代码组织成扩展，将访问修饰符应用于扩展本身，这将帮助您将整个代码段分类为public、internal或private.
//      当您将访问修饰符应用于扩展时，扩展的所有成员都会获得该访问级别。

// 十六. 代码安全
// 16.1 【可选处理】可选初始化器，可选链，可选类型处理 if let,guard let,compactMap
// 16.2 【错误处理】
// 16.2.1 使用枚举定义错误类型
// 16.2.2 有错误的地方使用throw抛出异常，会抛出异常的方法使用throws关键字声明
// 16.2.3 使用do { try } catch （let）来捕获异常
// 16.2.4 rethrows 自己不会抛出异常，但是会转抛异常
// 16.3   try ? 不处理异常
// 16.4   有异常直接退出应用 fatalError()
// 16.5   可抛出异常属性 get throws
/*
// 方法
// 属性 get throws
// 下标 get throws
 
do {
    try  throw -> throws
    
} catch() {
    fatalError()
}
 
try?
try!
 
*/

enum XXXError:Error {
    case failure(code:Int)
}

func mayError(value:String?) throws -> String {
    guard let value = value else {
        throw XXXError.failure(code: 404)
    }
    return value
}

do {
    try mayError(value: nil)
} catch(let XXXError.failure(code)) {
    print(code)
}

// 十七. 内存管理
// 17.1 弱引用  （weak var value:Int ?）可有可无，生命周期比当前对象短。
//      无主引用 (unowned var value:Int) 必需拥有，生命周期比当前对象长
// 17.2 捕获列表
// 17.3 [weak self] [unowned self] weak strong dance
/*
{ [weak self] (a:Int,b:Int) in
    guard let `self` = self else {return}
}
*/

// 十八. 并发
// 18.1 任务定义，取消任务，暂停任务
// 18.1 异步方法 async throws(恶心扔掉) try await
// 18.2 并行异步方法 async let / try await/ async throws
// 18.3 异步属性 get async throws  异步下标 异步序列
// 18.4 使用Actor来解决数据竞争问题

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

/// Test Doc
/// - Parameter message: message to say
/// - Returns: result content
func sayHello(message:String) -> String {
    return "Hello"
}

// [TODO 衍生内容] 如何规范化Doc

// 二. 打印

//直接按照要求打印内容
print("Hello Swift Apprentice reader!")
//会输出对调试有用的附加信息
debugPrint("Hello Swift Apprentice Reader!")

// 三. 运算符
// 算术运算符: + - * / %
// 关系运算符: == != > < >= <=  === !==
// 位运算: & | ~ ^ >> <<
// 逻辑运算符: ! &&  ||
// 赋值运算符: =
// 三目运算符: ?:
// 空合运算符: a??b
//           a必须是option类型
//           ?? 两边一定要有空格
//           a和b对存储类型必须保持一致
//           对可选类型进行空判断，如果包含一个值就进行解封，否则就返回一个默认值b
// 区间运算符: 闭区间 a...b
//           开区间 a..<b
// 通配符:    ~=

// 四. 常量变量
// 常量:
let number: Int = 10
// 一旦你声明了一个常量，你就不能改变它的数据 number = 0

// 数值进制:
// 十进制，没有前缀
// 二进制，前缀为0b
// 八进制，前缀为0o
// 十六进制，前缀为0x
// 记忆方式 [box]

// 随机值:
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

// 五.4 值类型和引用类型
// Swift 支持两种类型：值类型和引用类型。结构和枚举是值类型，而类和函数是引用类型，它们的行为不同。
// 区别：对象的存储地址不同
//      值类型：栈 引用类型：堆
//      赋值时候操作不同：
//      值类型：重新创建一个对象 引用类型：传递的是对象地址
// 写时复制(COW):系统仅在写入变量时复制后备存储,如果不写入会共享一个地址的对象

// 六 类型别名
typealias AnimalName = String
var dogName: AnimalName = "didi"
print(dogName)

// 七 控制符

// while() {} / repeat {} while

// for in
// for index in 1...6
// for _ in 1..< 8
// for (index,value) in array.enumerated()
// for (key,value) in maps

// if
// switch
// 1. 基本用法：不需要break
//    当匹配的 case 分支中的代码执行完毕后，程序会 终止 switch 语句，而不会继续执行下一个 case 分支。这也就是说，不需要在 case 分支中显式地使用 break 语句
//    fallthrough
//    fallthrough关键字不会检查它下一个将会落入执行的case中的匹配条件。fallthrough简单地使代码继续连接到下一个 case 中的代码(注意：是下一个，不是整个)
// 2. 多个case相同处理: case 0,1,2,3,4,5:             [合并匹配]
// 3. 使用范围匹配: case 0...5:                       [范围匹配]
// 4. 使用let where匹配: case let x where x % 2 == 0 [取值条件匹配] 把值拿下来，用where编写条件

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

// 8. where 语句

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
func returnValueDe(param1:Int,param2:Int) -> Int {
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


// 八. 可选类型：
// 将可选项想象成一个盒子：它要么只包含一个值，要么为空。当它不包含值时，它被称为包含nil. 盒子本身总是存在的；它总是在那里让你打开并看看里面
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
//举个例子，很多启动异步操作的函数接受一个闭包参数作为 completion handler。
//这类函数会在异步操作开始之后立刻返回，但是闭包直到异步操作结束后才会被调用。在这种情况下，闭包需要“逃逸”出函数，因为闭包需要在函数返回之后被调


// 12.6 自动闭包
// 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。
// 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。

// 原来模式
var customersInLine = ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: /*这里增加了 @autoclosure*/() -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )

// 改造后
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
    var height: Double {
        willSet {
            
        }
        didSet {
            
        }
    }
    
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
// didSet{} willSet{}用于监听存储属性的修改，get{} set{} 用于计算属性中
// didSet 属性值改变后触发，willSet 在属性值改变前触发
// willSet可以带一个newName的参数，没有的话，该参数默认命名为newValue。
// didSet可以带一个oldName的参数，表示旧的属性，不带的话默认命名为oldValue。
// 属性初始化时，willSet和didSet不会调用。只有在初始化上下文之外，当设置属性值时才会调用。
// 即使是设置的值和原来值相同，willSet和didSet也会被调用
// get{} set{} / didSet{} willSet{} 不能共存 也就是说 willSet/didSet观察者仅可用于存储的属性。如果您想监听计算属性的更改，只需将相关代码添加到属性的设置器中。

// 14.6 类型属性
struct Level {
    static var highestLevel = 1
    static let constant = 12
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

// 惰性修饰符会阻止计算存储属性的值，直到您的代码第一次使用它。当属性的初始值是计算密集型的，或者在初始化对象之前您不知道属性的初始值时，您将需要使用延迟初始化。

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

// 14.8 属性包装器
// 14.8.1 属性包装器基本使用
@propertyWrapper                                           // 1
struct ZeroToOne {                                         // 2
    
    private var value: Double
    var wrappedValue: Double {                               // 5
      get { value }
      set { value =  Self.clamped(newValue) }
    }
    
    init(wrappedValue: Double) {
      value = Self.clamped(wrappedValue)                     // 4
    }
    
    private static func clamped(_ input: Double) -> Double { // 3
        min(max(input, 0), 1)
    }
}

// 1. 该属性propertyWrapper表示这种类型可以用作属性包装器。因此，它必须提供一个名为wrappedValue.
// 2. 在其他所有方面，它只是一种标准类型。在这种情况下，它是一个带有私有变量的结构value。
// 3. 私有静态clamped(_:)辅助方法执行最小/最大舞蹈以将值保持在零和一之间。
// 4. 属性包装器类型需要包装的值初始值设定项。
// 5. The wrappedValue vends the clamped value.

// 有了上述的定义后就可以使用下面的定义来使用了
struct Color {
  @ZeroToOne var red: Double
  @ZeroToOne var green: Double
  @ZeroToOne var blue: Double
}

var superRed = Color(red: 2, green: 0, blue: 0)
print(superRed)
// r: 1, g: 0, b: 0

superRed.blue = -2
print(superRed)
// r: 1, g: 0, b: 0

// 从 Swift 5.5 开始，您也可以使用带有函数参数的属性包装器。
func printValue(@ZeroToOne _ value: Double) {
  print("The wrapped value is", value)
}
printValue(3.14)

// 14.8.2 Projecting values with $

@propertyWrapper
struct ZeroToOneV2 {
    private var value: Double
    var wrappedValue: Double {
      get { min(max(value, 0), 1) }
      set { value = newValue }
    }

    var projectedValue: Double { value }

  init(wrappedValue: Double) {
    value = wrappedValue
  }
}

//属性包装器还提供另一种类型，称为projectedValue. 您可以使用它来提供对未固定值的直接访问

func printValueV2(@ZeroToOneV2 _ value: Double) {
  print("The wrapped value is", value)
  print("The projected value is", $value)
}
printValueV2(3.14)
//这会打印出1.0包装值和3.14预计值。

// 14.8.3 添加参数

// 下面增加了上限up参数

/*
@propertyWrapper
struct ZeroTo {
  private var value: Double
  let upper: Double

  init(wrappedValue: Double, upper: Double) {
    value = wrappedValue
    self.upper = upper
  }

  var wrappedValue: Double {
    get { min(max(value, 0), upper) }
    set { value = newValue }
  }

  var projectedValue: Double { value }
}
 
 func printValueV3(@ZeroTo(upper: 10) _ value: Double) {
   print("The wrapped value is", value)
   print("The projected value is", $value)
 }
 printValueV3(42)

 */

// 14.8.4 通用

/*
 @propertyWrapper
 struct ZeroTo<Value: Numeric & Comparable> {
   private var value: Value
   let upper: Value

   init(wrappedValue: Value, upper: Value) {
     value = wrappedValue
     self.upper = upper
   }

   var wrappedValue: Value {
     get { min(max(value, 0), upper) }
     set { value = newValue }
   }

   var projectedValue: Value { value }
 }
 */

// 14.8 初始化器
// 14.8.1 当我们创建一个自定义初始化器时，结构的自动成员初始化器就失去作用了，我们必须显式添加自动成员初始化器
// 14.8.2 还有一种生成无参数初始化器件的方式就是给属性设置默认值。推荐使用这种方式。
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
// 14.11.1 在扩展中，不能将存储的属性添加到现有结构中，因为这会改变结构的大小和内存布局并破坏现有代码。
// 14.11.2 通过在扩展中添加自己的初始化程序，可以为结构保留编译器的成员初始化程序

struct PersonX {
    var name:String
    var age:Int
}

extension PersonX {
    //这个初始化器添加在类本身会导致结构的默认初始化器失效，但是放在扩展这里会保留结构的初始化器
    init(age:Int) {
        name  = "tbfungeek"
        self.age = age
    }
}

let person = PersonX(name: "tbfungeek", age: 23)

// 十五. 类
// 15.1 类是引用类型
// 15.2 与结构不同，类不自动提供一个成员初始化器
// 15.3 类类型的变量不存储实际实例——它存储对存储实例的内存位置的引用
// 15.4 结构体存储在栈上，类存储在堆上
// 15.5 === 表示是否是同一个对象，== 表示 是否内容相等
// 15.6 类是可变的，结构体是不可变的如果需要改变自身的值需要添加mutating修饰
// 15.7 使用扩展，扩展类添加方法和计算属性，也可以使用继承将功能添加到类中
// 15.8 Swift 中的继承是单继承
//      (一个 Swift 类只能从一个类继承，这个概念称为单继承,子类化的深度没有限制，这意味着您可以从也是子类的类中子类化)
// 15.8.1 继承后的子类可以获得父类的方法，覆写override 父亲的方法，通过super访问父类的属性
// 15.8.2 防止继承
// 有时您会想要禁止特定类的子类。Swift final为你提供了一个关键字来保证一个类永远不会得到一个子类：
/*
final class FinalStudent: Person {}
class FinalStudentAthlete: FinalStudent {} // Build error!
 */
// 15.8.3 防止子类覆写父类的方法
// 在方法前面添加final
/*
 class AnotherStudent: Person {
   final func recordGrade(_ grade: Grade) {}
 }

 class AnotherStudentAthlete: AnotherStudent {
   override func recordGrade(_ grade: Grade) {} // Build error!
 }
*/

// 15.10 多态性与类型转换

/*
if let hallMonitor = hallMonitor as? BandMember {
  print("This hall monitor is a band member and practices
         at least \(hallMonitor.minimumPracticeTime)
         hours per week.")
}
*/
// as: 转换为在编译时已知会成功的特定类型
// as?: 尝试性转换，转换失败会返回nil
// as!: 强行转换，转换失败会崩溃

// 15.11 类初始化器
// 在属性定义的默认值以及初始化器两个地方可以为属性提供初始化服务，在使用类对象之前必须完成整个类的初始化任务
// 15.11.1 每个初始化器的初始化顺序如下：
// 优先初始化本类在父类基础上新增的属性，然后调用super.init初始化父类的属性,这是强制的

class Student {
    var firstName: String = ""
    var lastName: String = ""
    init(firstName:String,lastName:String) {
        self.firstName = firstName
        self.lastName  = lastName
    }
}

class StudentAthlete: Student {
  var sports: [String]

  init(firstName: String, lastName: String, sports: [String]) {
    self.sports = sports
    super.init(firstName: firstName, lastName: lastName)
  }
  // original code
}

// 15.11.2 两阶段初始化

//阶段一：初始化类实例中所有存储的属性，从类层次结构的底部到顶部（当前类->直接子类）。在第一阶段完成之前，不能使用属性和方法。
//第二阶段：现在可以使用需要使用self.

/*
class StudentAthlete: Student {
  var sports: [String]

  init(firstName: String, lastName: String, sports: [String]) {
 
    =========================【第一阶段开始】=========================
    // 1 必须先完成自身成员的初始化
    self.sports = sports
    // 2 在这里可以完成后续所需要的变量生成，或者初始化父类初始化所需对象的初始化
    let passGrade = Grade(letter: "P", points: 0.0,
                          credits: 0.0)
    // 3 再调用父成员的初始化器
    super.init(firstName: firstName, lastName: lastName)
    =========================【第一阶段结束】=========================
 
    =========================【第二阶段开始】=========================
    // 4 可以调用self了
    recordGrade(passGrade)
  }
  // original code
}
*/

// 15.11.3 必需初始化器，指定初始化器和便利初始化器
// 15.11.3.1 必需初始化器 该类的子类都必需实现的初始化器 (协议中声明的初始化器，类实现的时候必须加required)
// 注意覆写必需的初始化程序不需要override关键字。
class StudentX {
  let firstName: String
  let lastName: String

  required init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
  // original code
}

class StudentAthleteX: StudentX {
  // Now required by the compiler!
  // 这里不需要override
  required init(firstName: String, lastName: String) {
    super.init(firstName: firstName, lastName: lastName)
  }
  // original code
}

// 15.11.3.2 指定初始化器和便利初始化器
// 便利构造器最终必须调用指定构造器
// 便利构造器必须从同一个类中调用另一个构造器。
// 指定初始化程序必须从其【直接超类】调用指定初始化程序。

// 15.12 对象的析构

/*
class Person {
  // original code
  deinit {
    print("\(firstName) \(lastName) is being removed
          from memory!")
  }
}
 */


// 十六. 枚举
// 16.0 概览 枚举 = 计算属性 + 方法 + 原始值（携带常量） + 关联值 （携带变量）
// 16.1 定义
/*
enum Month: Int /*这里可以指定类型*/ {
}*/

/*
enum Month: Int {
  case january = 1, february = 2, march = 3, april = 4, may = 5,
  june = 6, july = 7, august = 8, september = 9,
  october = 10, november = 11, december = 12
}

 enum Month {
   case january
   case february
   case march
   case april
   case may
   case june
   case july
   case august
   case september
   case october
   case november
   case december
 }
 */

// 16.2 原始值
// 16.2.1 使用原始值初始化
// let fifthMonth = Month(rawValue: 5)
// 16.2.2 访问原始值
/*
 func monthsUntilWinterBreak(from month: Month) -> Int {
   Month.december.rawValue - month.rawValue
 }
 */
// 16.2.3 定义时候指定原始值
enum Coin: Int {
  case penny = 1
  case nickel = 5
  case dime = 10
  case quarter = 25
}

// 16.3 关联值
// 16.3.1 枚举可以具有原始值或关联值，但不能同时具有两者。
enum WithdrawalResult {
  case success(newBalance: Int)
  case error(message: String)
}

/*
func withdraw(amount: Int) -> WithdrawalResult {
  if amount <= balance {
    balance -= amount
    return .success(newBalance: balance)
  } else {
    return .error(message: "Not enough money!")
  }
}*/

// 16.3.2 使用if（switch） case / guard case 来提取关联值中的值

/*
let result = withdraw(amount: 99)
switch result {
case .success(let newBalance):
  print("Your new balance is: \(newBalance)")
case .error(let message):
  print(message)
}
 
 let request = HTTPMethod.post(body: "Hi there")
 guard case .post(let body) = request else {
   fatalError("No message was posted")
 }
 print(body)

 */

// 16.4 枚举的遍历

enum Pet: CaseIterable {
  case cat, dog, bird, turtle, fish, hamster
}

for pet in Pet.allCases {
  print(pet)
}

// 十七. 协议
// 17.1 协议不是也不能用于实例化对象的，而是用于约束和描述接口或者类的概要的。使用协议，可以定义一组通用的属性和行为，具体类型可以执行和实现。
// 17.2
// 使用扩展遵循的优点是，可以将协议采用与必要的方法和属性很好地分组，而不是让一堆协议使您的类型定义变得混乱。
// 17.3 一旦一个类型实现了协议的所有成员，就称该类型遵循协议。
// 17.4 协议定义 = 属性 + 初始化器 + 方法 + 继承
// 17.4.1 协议中的属性
// 在协议中定义属性时，您必须将它们明确标记为get或get set，有点类似于声明计算属性的方式。但是，与方法非常相似，您不包含任何属性实现。
// 即使某个属性只有一个get要求，仍然可以将其实现为存储属性或读写计算属性。协议中的要求只是最低要求。
// var numberOfWheels: Int { get } 可以与下面的类型对应
// 一个常量存储属性。
// 变量存储属性。
// 只读计算属性。
// 读写计算属性。
protocol VehicleProperties {
  var weight: Int { get }
  var name: String { get set }
}

// 17.4.2 协议中的初始化器
/*
protocol Account {
  var value: Double { get set }
  init(initialAmount: Double)
  init?(transferAccount: Account)
}
*/
//如果使用类类型遵守具有所需初始化程序的协议，则这些初始化程序必须使用required关键字：
/*
 class BitcoinAccount: Account {
   var value: Double
   required init(initialAmount: Double) {
     value = initialAmount
   }
   required init?(transferAccount: Account) {
     guard transferAccount.value > 0.0 else {
       return nil
     }
     value = transferAccount.value
   }
 }

 var accountType: Account.Type = BitcoinAccount.self
 let account = accountType.init(initialAmount: 30.00)
 let transferAccount = accountType.init(transferAccount: account)!

 */
// 17.4.3 协议中的方法
// 参数不能有默认值
enum Direction {
  case left
  case right
}

protocol DirectionalVehicle {
  func accelerate()
  func stop()
  func turn(_ direction: inout Direction)
  func description() -> String
}
// 17.4.4 协议继承
/*
protocol WheeledVehicle: Vehicle {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}
*/

// 17.4.5 协议中的关联类型
protocol WeightCalculatable {
  associatedtype WeightType
  var weight: WeightType { get }
}

class HeavyThing: WeightCalculatable {
  // This heavy thing only needs integer accuracy
  typealias WeightType = Int

  var weight: Int { 100 }
}

class LightThing: WeightCalculatable {
  // This light thing needs decimal places
  typealias WeightType = Double

  var weight: Double { 0.0025 }
}
//上面使用typealias指定了对应的关联类型，但是可以不指定的，通过类型推断可以自动推断

// 17.4.6 将协议中的关联类型限制为特定类型
/*
protocol WeightCalculatable {
  associatedtype WeightType: Numeric
  var weight: WeightType { get }
}
*/

// 17.5 实现多个协议

/*
protocol Wheeled {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}

class Bike: Vehicle, Wheeled {
  // Implement both Vehicle and Wheeled
}
*/

// 17.6 协议组合
// 有时您需要一个函数来获取必须符合多种协议的数据类型。这就是协议组合的用武之地
/*
 func roundAndRound(transportation: Vehicle & Wheeled) {
     transportation.stop()
     print("The brakes are being applied to
           \(transportation.numberOfWheels) wheels.")
 }

 roundAndRound(transportation: Bike())
 // The brakes are being applied to 2 wheels.
*/

// 17.7 只能类遵循的协议
// 后面增加AnyObject即可
protocol Named: AnyObject {
  var name: String { get set }
}

// 17.8 常用的标准库协议
// 17.8.1 Equatable
// 对自定义类判断是否相等

class Record {
  var wins: Int
  var losses: Int
  init(wins: Int, losses: Int) {
      self.wins = wins
      self.losses = losses
  }
}

extension Record: Equatable {
  static func ==(lhs: Record, rhs: Record) -> Bool {
    lhs.wins == rhs.wins &&
    lhs.losses == rhs.losses
  }
}

let recordA = Record(wins: 10, losses: 5)
let recordB = Record(wins: 10, losses: 5)

recordA == recordB

// 17.8.2 Comparable
// Comparable 是Equatable的子类

protocol Comparable: Equatable {
  static func <(lhs: Self, rhs: Self) -> Bool
  static func <=(lhs: Self, rhs: Self) -> Bool
  static func >=(lhs: Self, rhs: Self) -> Bool
  static func >(lhs: Self, rhs: Self) -> Bool
}

/*
extension Record: Comparable {
  static func <(lhs: Record, rhs: Record) -> Bool {
    if lhs.wins == rhs.wins {
      return lhs.losses > rhs.losses
    }
    return lhs.wins < rhs.wins
  }
}
*/

// 17.8.3 Hashable
// Hashable是Equatable的子类，想要作为Dictionary的key的时候就必须实现Hashable，可以通过Hashable协议快速找到集合中的元素
/*
class Student {
  let email: String
  let firstName: String
  let lastName: String

  init(email: String, firstName: String, lastName: String) {
    self.email = email
    self.firstName = firstName
    self.lastName = lastName
  }
}

extension Student: Hashable {
  static func ==(lhs: Student, rhs: Student) -> Bool {
    lhs.email == rhs.email &&
    lhs.firstName == rhs.firstName &&
    lhs.lastName == rhs.lastName
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(email)
    hasher.combine(firstName)
    hasher.combine(lastName)
  }
}*/

// 17.8.4 Identifiable
// Identifiable协议提供了一个独特的id属性，Identifiable只需要一个get名为id其类型必须为的属性Hashable。
/*
extension Student: Identifiable {
  var id: String {
    email
  }
}*/

// 17.8.5 CustomStringConvertible
// CustomStringConvertible协议可帮助您记录和调试实例。
/*
protocol CustomStringConvertible {
  var description: String { get }
}

extension Student: CustomStringConvertible {
  var description: String {
    "\(firstName) \(lastName)"
  }
}
print(john)
// Johnny Appleseed
*/
//对应的CustomDebugStringConvertible定义了debugDescription在debugPrint()打印的时候输出

// 17.8.6 CaseIterable
// 遍历枚举的时候使用

// 17.8.7 Encodable/Decodable

// 17.8.7.1 对应协议介绍
// (1) Encodable
// func encode(to: Encoder) throws
// (2) Decodable
// init(from decoder: Decoder) throws

// (3) Codable 意味着可以被编码和解码
// typealias Codable = Encodable & Decodable
// 如果希望你类型可编码，最简单的方法是遵守Codable并确保其所有存储的属性也是可编码的。

struct Employee: Codable {
  var name: String
  var id: Int
  var favoriteToy: Toy?
}

struct Toy: Codable {
  var name: String
}

// (4) CodingKeys 重命名属性
/*
struct Employee: Codable {
  var id: Int
  var name: String
  var favoriteToy: Toy?

  enum CodingKeys: String, CodingKey {
    case id = "employeeId" //将id 显示为employeeId
    case name
    case favoriteToy
  }
}
 //如果打印 JSON，就会看到它id已更改为employeeId.
 { "employeeId": 7, "name": "John Appleseed", "favoriteToy": {"name": "Teddy Bear"}}
 */

// 17.8.7.2 手动编码和解码
// 17.8.7.2.1 编码

/*
 更新CodingKeys以使用密钥gift而不是favoriteToy：
 enum CodingKeys: String, CodingKey {
   case id = "employeeId"
   case name
   case gift
 }

 extension Employee: Encodable {
   func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     try container.encode(name, forKey: .name)
     try container.encode(id, forKey: .id)
     try container.encode(favoriteToy?.name, forKey: .gift)
   }
 }
 
 extension Employee: Encodable {
   func encode(to encoder: Encoder) throws {
     var container = encoder.container(keyedBy: CodingKeys.self)
     try container.encode(name, forKey: .name)
     try container.encode(id, forKey: .id)
     try container.encodeIfPresent(favoriteToy?.name, forKey: .gift) // 如果没有favoriteToy json中将不包含这个key
   }
 }
 */

// 17.8.7.2.2 解码
/*
 extension Employee: Decodable {
   init(from decoder: Decoder) throws {
     let values = try decoder.container(keyedBy: CodingKeys.self)
     name = try values.decode(String.self, forKey: .name)
     id = try values.decode(Int.self, forKey: .id)
     if let gift = try values.decode(String?.self, forKey: .gift) {
       favoriteToy = Toy(name: gift)
     }
   }
 }
 
 extension Employee: Decodable {
   init(from decoder: Decoder) throws {
     let values = try decoder.container(keyedBy: CodingKeys.self)
     name = try values.decode(String.self, forKey: .name)
     id = try values.decode(Int.self, forKey: .id)
     if let gift = try values.decodeIfPresent(String.self, forKey: .gift) {
       favoriteToy = Toy(name: gift)
     }
   }
 }
 */

// 17.9 面向协议编程
// 17.9.1 协议扩展
// 扩展不但可以针对类,结构体，枚举，还可以这对协议创建扩展
// 协议扩展让您可以编写协议的实现代码，甚至可以为协议所需的方法编写默认实现。
// 协议扩展是面向协议编程的主要驱动力，让您可以编写适用于任何符合协议的类型的代码。

protocol TeamRecord {
  var wins: Int { get }
  var losses: Int { get }
  var winningPercentage: Double { get }
}

extension TeamRecord {
  var gamesPlayed: Int {
    wins + losses
  }
}
// 协议扩展一般用于对协议中的方法提供默认的实现
// 尽管您还没有为采用该协议的具体类型编写代码，但您可以在其扩展中使用协议成员。那是因为编译器知道任何符合的类型都TeamRecord将具有TeamRecord.
// 现在您可以编写一个简单的类型来采用TeamRecord和使用gamesPlayed而无需重新实现它。
struct BaseballRecord: TeamRecord {
  var wins: Int
  var losses: Int

  var winningPercentage: Double {
    Double(wins) / Double(wins + losses)
  }
}

let sanFranciscoSwifts = BaseballRecord(wins: 10, losses: 5)
sanFranciscoSwifts.gamesPlayed // 15
// 默认实现允许您向协议添加功能，同时显着减少重复或“样板”代码。默认实现不会阻止类型自行实现协议成员
struct HockeyRecord: TeamRecord {
  var wins: Int
  var losses: Int
  var ties: Int

  // Hockey record introduces ties, and has
  // its own implementation of winningPercentage
  var winningPercentage: Double {
    Double(wins) / Double(wins + losses + ties)
  }
}

//HockeyRecord 为TeamRecord提供了自定义的winningPercentage，而不使用默认的winningPercentage

// 17.9.2 类型约束
// Swift 允许为某些采用类型编写扩展。在协议扩展上使用类型约束，您可以使用该类型的方法和属性。

protocol PostSeasonEligible {
  var minimumWinsForPlayoffs: Int { get }
}

extension TeamRecord where Self: PostSeasonEligible {
  var isPlayoffEligible: Bool {
    wins > minimumWinsForPlayoffs
  }
}

//将类型约束应用于TeamRecord扩展意味着在扩展中，self已知是TeamRecord和PostSeasonEligible
//这意味着我们可以使用在这两种类型上定义的属性和方法。还可以使用类型约束在特定类型组合上创建默认实现。
//也就是说通过类型约束可以同时使用两个类型的属性和方法，以及在特定类型上创建默认实现
protocol Tieable {
  var ties: Int { get }
}

// With type constraints, you can also make a default implementation for winningPercentage,
// specifically for types that are both a TeamRecord and Tieable:
// 通过类型约束可以指定一个winningPercentage默认实现，当这个类既是TeamRecord又是Tieable的时候
extension TeamRecord where Self: Tieable {
  var winningPercentage: Double {
    Double(wins) / Double(wins + losses + ties)
  }
}

//Now, any type that is both a TeamRecord and Tieable won’t need to implement a winningPercentage that factors in ties:
struct RugbyRecord: TeamRecord, Tieable {
  var wins: Int
  var losses: Int
  var ties: Int
  //这里就不需要实现winningPercentage了 因为TeamRecord中已经提供了
}

let rugbyRecord = RugbyRecord(wins: 8, losses: 7, ties: 1)
rugbyRecord.winningPercentage // 0.5

// 十八. 泛型
// 18.1 定义：
// class Keeper<Animal> {}
// var aCatKeeper = Keeper<Cat>()
// 要定义一个泛型类型Keeper<Animal>，你只需要选择泛型类型的名称和类型参数。类型参数的名称，也称为占位符，应该阐明类型参数和泛型类型之间的关系。

class Cat {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Dog {
  var name: String

  init(name: String) {
    self.name = name
  }
}

class Keeper<Animal> {
  var name: String
  var morningCare: Animal
  var afternoonCare: Animal

  init(name: String, morningCare: Animal, afternoonCare: Animal) {
    self.name = name
    self.morningCare = morningCare
    self.afternoonCare = afternoonCare
  }
}

//可以在存储属性、计算属性、方法签名和嵌套类型的定义中的任何位置使用类型参数。
let jason = Keeper(name: "Jason",
            morningCare: Cat(name: "Whiskers"),
          afternoonCare: Cat(name: "Sleepy"))

// 用在方法中的用法
func test<T,K>(param1:T,param2:K) {
    print(param1)
    print(param2)
}
test(param1: 2, param2: "tbfungeek")

// 对泛型进行约束
func testFuncs<T:Numeric>(param1:T) {
    print(param1 + 3)
}
testFuncs(param1: 34)

// 18.3 类型擦除
// 18.3.1 类型擦除概述
// 类型擦除是一种用于擦除不重要的类型信息的技术。将不同某些行为类似，但是有自己特性的不同类，进行类型擦除，这样就可以放在一起对待统一处理了。
// 类型Any是最终类型擦除。它会删除所有类型信息。
// 不仅在 Swift 标准库中，在其他库中也有几种类型擦除类型。例如，AnyIterator, AnySequence, AnyCollection,AnyHashable是 Swift 标准库的一部分。
// AnyPublisher是 Combine 框架AnyView的一部分，也是 SwiftUI 的一部分。

// 18.3.2 类型擦除

protocol PetX {
  associatedtype Food
  func eat(_ food: Food)
}

enum PetFood { case dry, wet }

struct CatX: PetX {
  func eat(_ food: PetFood) {
    print("Eating cat food.")
  }
}

struct DogX: PetX {
  func eat(_ food: PetFood) {
    print("Eating dog food.")
  }
}

// let pets: [PetX] = [DogX(), CatX()]
// 这种方式不行会报 use of protocol 'PetX' as a type must be written 'any PetX'的错误

struct AnyPet<Food>: PetX {                  // 1
  private let _eat: (Food) -> Void          // 2

  // 3
  init<SomePet: PetX>(_ pet: SomePet/*遵循协议的实现者，也是要被擦除的类型*/) where SomePet.Food == Food {
    _eat = pet.eat(_:) /*提取出要用的类型中通用的方法，差异的就不管了*/
  }

  // 4
  func eat(_ food: Food) {
    //执行
    _eat(food)
  }
}

// let pets = [AnyPet(Dog()), AnyPet(Cat())]
// 这种写法就可以了
// 更近一步可以提供eraseToAnyPet实现

extension PetX {
    
  //将自己擦除类型
  func eraseToAnyPet() -> AnyPet<Food> {
    .init(self)
  }
    
    func anyPet() -> some PetX {
        return self
    }
}

let morePets = [DogX().eraseToAnyPet(),
                CatX().eraseToAnyPet()]

// 18.3 不透明的返回类型
//（对调用方屏蔽类型信息，但是返回支持的协议信息）
//（不同分支返回的类型必须一致）
//（可以作为组合实现）
// 不透明类型是指编译器能获取到类型信息，但是模块使用者却不能获取到，被调用方知能获得返回对象的具备的功能，但是不知道具体的类型
// 具有不透明返回类型的函数或方法会隐藏返回值的类型信息。函数不再提供具体的类型作为返回类型，而是根据它支持的协议来描述返回值。
// 隐藏类型信息在模块和调用该模块的代码的连接处很有用，因为返回值的底层类型可以保持私有。与返回类型为协议类型的值不同，不透明类型保留类型标识——编译器可以访问类型信息，但调用该模块的代码却不能。
// 它的优点是您不需要创建Any***包装器类型。不透明的返回类型通过使编译器跟踪具体的返回类型而起作用，但只让函数调用者使用支持的协议接口。
// 协议类型会导致类型擦除，而不透明类型则不会。
// 不透明类型和泛型的区别
// 不透明类型是被调用者知道类型的具体信息，而被调用方只能根据返回协议的信息来了解返回对象，而泛型调用方知道返回对象的具体信息，而被调用者只知道抽象的描述。

/* [原表述内容]
 可以将不透明类型视为与泛型类型相反的类型。泛型类型，以一种从函数实现中抽象出来的方式，
 让调用函数的代码选择该函数参数和返回值的类型。而不透明类型允许函数实现以一种从函数内部的代码中抽象出来的方式为它返回的值选择类型。
 */

func makeValue() -> some FixedWidthInteger {
  42
}

// 这里的魔力是some FixedWidthInteger。（Swift 中所有不同的整数类型都采用该FixedWidthInteger协议。）对于这个返回类型，你唯一知道的是它是一种整数。

/*
func makeValueRandomly() -> some FixedWidthInteger {
  if Bool.random() {
    return Int(42)
  }
  else {
    return Int8(24) // 这里会报错误，所有路径返回的类型必须是同一种类型
  }
}
// 如果具有不透明返回类型的函数从多个位置返回，则所有可能的返回值必须具有相同的类型。
 
*/
// FixedWidthInteger有关联的类型；不能将其用作存在类型
// let v: FixedWidthInteger = 42 // compiler error
// let v = makeValue() // works

// 还可以将值作为实现协议组合的对象返回
func makeEquatableNumericInt() -> some Numeric & Equatable {
    1
}

func makeEquatableNumericDouble() -> some Numeric & Equatable {
    1.0
}

let value1 = makeEquatableNumericInt()
let value2 = makeEquatableNumericInt()

print(value1 == value2) // prints true
print(value1 + value2) // prints 2
// print(value1 > value2) // error 虽然 返回的1和1.0 都符合Comparable 但是some Numeric & Equatable不包含Comparable所以这里会报错误

// 即使从外部看起来类型相同， some Numeric & Equatable编译器也知道具体类型Int，并且与Double此示例不同
// Compiler error, types don't match up
// makeEquatableNumericInt() == makeEquatableNumericDouble()

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
/*
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
*/

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

// 关于参数总结:
// 协议方法中不能使用默认值
// 下标参数不能使用inout或者默认值

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

struct Point {
  let x, y: Int
  let desc:String
}

@dynamicMemberLookup
struct CircleSSS {
    let center:Point
    let radius:Double
    
    subscript(dynamicMember keyPath:KeyPath<Point/*应用于那种类型的对象*/,String/*输出的类型*/>) -> String {
        center[keyPath: keyPath]
    }
}

let circlesss = CircleSSS(center: Point(x: 23, y: 34, desc: "tbfungeek"), radius: 34.5)
circlesss.desc


// 21.6 键路径作为函数
//如果函数是【只有一个参数的闭包】并且【键路径的返回类型与闭包的返回类型匹配】，则可以将键路径用作函数：
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

// 【整体格式】 if/guard/switch/for case .枚举(let)/元组(let) where XXXXXX = 枚举/元组

// 22.5 场景 5 非可选匹配
let namess: [String?] =
  ["Michelle", nil, "Brandon", "Christine", nil, "David"]

// 找出非可选的进入
for case let name? in namess {
  print(name) // 4 times
}

// 22.6 场景 6 where 模式
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
case let valueX where valueX.height < 50:
  print("Shorter than 50 units")
case let valueX where valueX.width > 20:
  print("Over 50 tall, & over 20 wide")
case let valueX where valueX.background == "Green":
  print("Over 50 tall, at most 20 wide, & green") // Printed!
default:
  print("This view can’t be described by this example")
}

// 22.7 场景 7 用逗号链接
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

// 22.11 通配符规则 (精确，通配，取值条件判断)
// 使用下划线来匹配分量的任何值
// 值绑定，只需在匹配模式时使用var or let来声明变量或常量
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

struct StudentS {
    var name:String = "test"
    var age:Int = 29
    
    static func ~=(pattern:StudentS,value:String) -> Bool {
        if (pattern.name == value) {
            return true
        }
        return false
    }
}

let isStudentWeWonted = StudentS() ~= "test"

if case StudentS() = "test" {
  print("equal")
} else {
    print("not equal")
}

// 二十三. 错误处理

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
  case tooFew(numberOnHand: Int)
  case doNotSell
  case wrongFlavor
  case inventory
  case noPower
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

// 二十四. 内存管理
// 24.1 弱引用
// 弱引用是在对象的所有权中不扮演任何角色的引用。使用它们的好处是它们会自动检测底层对象何时消失。
// 这种自动检测就是为什么您总是使用可选类型声明它们的原因。一旦引用计数达到零，它们就会变为 nil
// weak var editor: Editor?
// 24.2 无主引用
// 它的行为很像弱引用，因为它们不会更改对象的引用计数。
// 然而，与弱引用不同，它们总是期望有一个值——你不能将它们声明为可选项。可以这样想：没有作者就不可能存在教程。必须有人为编辑写红线。:] 同时，教程不“拥有”作者，所以引用应该是无主的。

/*
class Tutorial {
  let title: String
  let author: Author
  weak var editor: Editor?

  init(title: String, author: Author) {
    self.title = title
    self.author = author
  }
  
  deinit {
    print("Goodbye tutorial \(title)!")
  }
}

class Author {
  let name: String
  var tutorials: [Tutorial] = []

  init(name: String) {
    self.name = name
  }

  deinit {
    print("Goodbye author \(name)!")
  }
}
 
 do {
   let author = Author(name: "Cosmin")
   let tutorial = Tutorial(title: "Memory management",
                           author: author)
   let editor = Editor(name: "Ray")
   author.tutorials.append(tutorial)
   tutorial.editor = editor
   editor.tutorials.append(tutorial)
 }
 */

/*
class Tutorial {
  unowned let author: Author
  // original code
}
 */

// 24.3 捕获列表
// 捕获列表是由闭包捕获的变量列表，并出现在闭包的开头任何参数之前。

var counter = 0
var g = {
    print(counter)
}
counter = 1
g()

//g()闭包打印变量的counter更新值 1，因为它具有对counter变量的引用

counter = 0
g = { [counter] in
    print(counter)
}
counter = 1
g()

//在这种g()情况下，闭包也会打印 0，因为counter它是一个阴影副本。
//捕获列表将导致闭包捕获并存储存储在具有引用类型的捕获变量中的当前引用。通过此引用对对象所做的更改在闭包之外仍然可见

// 24.4 unowned self

/*
lazy var description: () -> String = {
  [unowned self] in
  "\(self.title) by \(self.author.name)"
}
*/

// 24.5 weak self
/*
 lazy var description: () -> String = {
   [weak self] in
   "\(self?.title) by \(self?.author.name)"
 }
 */

// 24.6 weak strong dance

/*
lazy var description: () -> String = {
    [weak self] in
    guard let self = self else {
      return "The tutorial is no longer available."
    }
    return "\(self.title) by \(self.author.name)"
}*/

// 二十五. 并发

// 25.1 创建任务

Task {
  print("Doing some work on a task")
  let sum = (1...100).reduce(0, +)
  print("1 + 2 + 3 ... 100 = \(sum)")
}

print("Doing some work on the main actor")

// 25.2 取消任务

let task = Task {
  print("Doing some work on a task")
  let sum = (1...100).reduce(0, +)
  try Task.checkCancellation()
  print("1 + 2 + 3 ... 100 = \(sum)")
}

print("Doing some work on the main actor")
task.cancel()

// 25.3 暂停任务

Task {
  print("Hello")
  try await Task.sleep(nanoseconds: 1_000_000_000)
  print("Goodbye")
}

// 25.4 异步方法

func helloPauseGoodbye() async throws {
  print("Hello")
  try await Task.sleep(nanoseconds: 1_000_000_000)
  print("Goodbye")
}

Task {
  try await helloPauseGoodbye()
}

// 25.4 并发任务

/*
func findTitlesSerial(first: URL, second: URL) async throws -> (String?,
                                                                String?) {
  let title1 = try await findTitle(url: first)
  let title2 = try await findTitle(url: second)
  return (title1, title2)
}
 */
//两个任务顺序执行

/*
func findTitlesParallel(first: URL, second: URL) async throws -> (String?,
                                                                  String?) {
  async let title1 = findTitle(url: first)   // 1
  async let title2 = findTitle(url: second)  // 2
  let titles = try await [title1, title2]    // 3
  return (titles[0], titles[1])              // 4
}
*/
//两个任务并行执行

// 25.4.1 异步属性

/*
extension Domains {
  static var domains: [Domain] {
    get async throws {
      try await fetchDomains()
    }
  }
}
 
Task {
 dump(try await Domains.domains)
}
*/


// 25.4.2 异步下标

/*
 extension Domains {
   enum Error: Swift.Error { case outOfRange }

   static subscript(_ index: Int) -> String {
     get async throws {
       let domains = try await Self.domains
       guard domains.indices.contains(index) else {
         throw Error.outOfRange
       }
       return domains[index].attributes.name
     }
   }
 }

 Task {
   dump(try await Domains[4])  // "Unity", as of this writing
 }

 */

// 25.4.3 异步序列

/*
 func findTitle(url: URL) async throws -> String? {
   for try await line in url.lines {
     if line.contains("<title>") {
       return line.trimmingCharacters(in: .whitespaces)
     }
   }
   return nil
 }
 */

// 25.5 Anchor
// Anchor 用于解决资源竞争问题
// Swift 并发包括特殊类型actor和Sendable来处理这个一致性问题。

// 1
class Playlist {
  let title: String
  let author: String
  private(set) var songs: [String]
  
  init(title: String, author: String, songs: [String]) {
    self.title = title
    self.author = author
    self.songs = songs
  }
  
  func add(song: String) {
    songs.append(song)
  }
  
  func remove(song: String) {
    guard !songs.isEmpty, let index = songs.firstIndex(of: song) else {
      return
    }
    songs.remove(at: index)
  }
  
  func move(song: String, from playlist: Playlist) {
    playlist.remove(song: song)
    add(song: song)
  }
  
  func move(song: String, to playlist: Playlist) {
    playlist.add(song: song)
    remove(song: song)
  }
}

//这个类有四个改变状态的方法songs。这些方法不能同时使用。如果您让它们并发，您将有多个任务同时更改播放列表，从而导致不可预测且不一致的状态。
//您可以通过将类转换为actor来解决此问题。与类一样，actor 是表示共享可变状态的引用类型。重要的是，参与者阻止并发访问他们的状态。它们只允许一种方法在任何给定时间访问它们的状态。

// 25.5.1 将类转换为Anchor

/*
 // 1
 actor Playlist {
   let title: String
   let author: String
   private(set) var songs: [String]
   
   init(title: String, author: String, songs: [String]) {
     self.title = title
     self.author = author
     self.songs = songs
   }
   
   func add(song: String) {
     songs.append(song)
   }
   
   func remove(song: String) {
     guard !songs.isEmpty, let index = songs.firstIndex(of: song) else {
       return
     }
     songs.remove(at: index)
   }
   
   // 3
   func move(song: String, from playlist: Playlist) async {
     // 2
     await playlist.remove(song: song)
     add(song: song)
   }
   
   func move(song: String, to playlist: Playlist) async {
     await playlist.add(song: song)
     remove(song: song)
   }
 }
 以下是更改的内容：
 关键字actor替换关键字class。
 两者move(song:from:)都有move(song:to:)一个附加Playlist参数。此参数意味着它们对两个参与者进行操作：self和playlist。您必须使用awaitto 访问playlist，因为这些方法可能必须等待轮到它们才能获得对参与者的同步访问playlist。
 因为move(song:from:)并在它们的实现中move(song:to:)使用await，您必须将它们标记为async. 所有的actor方法已经隐式异步了，但是实现强制它在这里是显式的。
 */

// 25.5.2 nonisolated
// nonisolated关键字通过禁用参与者的同步功能使该属性同步

// ONE MORE STEP
// SwiftLint: https://github.com/realm/SwiftLint
// SwiftFormat: https://github.com/nicklockwood/SwiftFormat
// Google的Swift代码规范: https://google.github.io/swift/#apples-markup-format
// API Design Guidelines: https://www.swift.org/documentation/api-design-guidelines/
// Swift 设计模式: https://refactoringguru.cn/design-patterns/swift


























