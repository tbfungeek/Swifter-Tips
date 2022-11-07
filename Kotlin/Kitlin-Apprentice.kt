import kotlin.math.*
//单行注释
/**
    多行注释
 */

 /**
    //嵌套注释
  */

const val reallyConstant:Int = 42

fun main() {
    // 输出数据
    println("Hello Kotlin!")
    // + - * / % 
    // shl shr
    println(sin(45 * PI/180))

    val number:Int = 10
    var varnumber:Int = 23

    //Kotlin 不允许您将一种类型的值分配给另一种类型并避免这些问题。
    var intValue:Int = 12
    var doubleValue:Double = 0.5
    //intValue = doubleValue
    intValue = doubleValue.toInt()

    // 混合运算
    // 不需要强制转换类型
    val hourlyRate: Double = 19.5
    val hoursWorked: Int = 10
    val totalCost: Double = hourlyRate * hoursWorked

    // 类型推断
    var doubleVar = 12.4

    // 字符串
    var charValue:Char = 'a'
    var stringValue:String = "stringValue"

    var anotherString:String = "onther String"
    // 连字符
    println(stringValue + anotherString)
    // 占位
    println("This is a PlaceHolder string $doubleVar")

    var vect2D = Pair(2,3)
    var (x,y) = vect2D

    var vect3D = Triple(23,23.2,45)
    var (v1,v2,v3) = vect3D

    println(x)
    println(y)

    varnumber -= 1
    println(number)
    println(varnumber)
    println(reallyConstant)

    //Boolean Byte Short Int Long Float Double Char String Any Unit Nothing

    var alsoTrue = !(1 == 2)

    // if while / do {} while / break 
    // for 循环  for 变量 in 范围 step n
    // 范围 0..5 [0-5] / 0 until 5 [0-5) / 5 downTo 0 [5-0]
    // repeat (次数) {}
    // continue break
    // when 

    /*
        val hourOfDay = 12
        val timeOfDay = if (hourOfDay < 6) {
            "Early morning"
        } else if (hourOfDay < 12) {
            "Morning"
        } else if (hourOfDay < 17) {
            "Afternoon"
        } else if (hourOfDay < 20) {
            "Evening"
        } else if (hourOfDay < 24) {
            "Late evening"
        } else {
            "INVALID HOUR!"
        }
        println(timeOfDay)
     */

    var num = 10
    // 不需要break在每个分支中包含语句，因为when表达式只会使用第一个匹配的分支然后返回。
    when (num) {
        0 -> println("Zero")
        else -> println("Non-zero")
    }

    var string = "Dog"
    when (string) {
        "Cat","Dog" -> println("Animal is a house pet.")
        else -> println("Animal is not a house pet.")
    }

    val numberName = when (num) {
        2 -> "two"
        4 -> "four"
        6 -> "six"
        8 -> "eight"
        10 -> "ten"
        else -> {
            println("Unknown number")
            "Unknown"
        }
    }
    println(numberName)

    val hourOfDay = 12
    val timeOfDay:String
    /* 
    timeOfDay = when(hourOfDay) {
        0,1,2,3,4,5 -> "Early morning"
        6,7,8,9,10,11 -> "Morning"
        12,13,14,15,16 -> "Afternoon"
        17,18,19 -> "Evening"
        20,21,22,23 -> "Late evening"
        else -> "INVALID HOUR!"
    }
    */
    timeOfDay = when(hourOfDay) {
        in 0..5 -> "Early morning"
        in 6..11 -> "Morning"
        in 12..16 -> "Afternoon"
        in 17..19 -> "Evening"
        in 20..23 -> "Late evening"
        else -> "INVALID HOUR!"
    }
    println(timeOfDay)

    // 带条件的 when 表达式
    /*
        when {
            number % 2 == 0 -> println("Even")
            else -> println("Odd")
        }

        val (x, y, z) = Triple(3, 2, 5)
        when {
            x == 0 && y == 0 && z == 0 -> println("Origin")
            y == 0 && z == 0 -> println("On the x-axis at x = $x")
            x == 0 && z == 0 -> println("On the y-axis at y = $y")
            x == 0 && y == 0 -> println("On the z-axis at z = $z")
            else -> println("In space at x = $x, y = $y, z = $z")
        }
    */
    
    fun funcName(name:String,value:Int = 100):Boolean {
        return true
    }

    fun funcNames(name:String,value:Int = 100):Pair<Int,Int> {
        return Pair(10,10)
    }

    println(funcName(name = "tbfungeek",value = 4))
    println(funcName(name = "tbfungeek"))
    println(funcNames(name = "tbfungeek"))
    var (value1,value2) = funcNames(name = "test")
    println(value1)
    fun multiplyInferred(number:Int,multiplier:Int) = number * multiplier
    println(multiplyInferred(10,3))
    // 重载 不同数量的参数。不同的参数类型。仅返回类型不足以区分两个函数。

    fun add(a:Int,b:Int):Int {
        return a + b
    }
    var function = ::add
    println(function(4,2))

    fun printResult(function:(Int,Int) -> Int,a:Int,b:Int) {
        val result = function(a,b)
        println(result)
    }
    printResult(::add,4,2)

    var authorName: String? = "Joe Howard"
    var authorAge: Int? = 24
    // authorAge!! 强制解包

    //Smart casts
    var nonNullableAuthor: String
    var nullableAuthor: String?

    if (authorName != null) {
        nonNullableAuthor = authorName
        println(nonNullableAuthor)
    } else {
        nullableAuthor = authorName
        println(nullableAuthor)
    }

    //Safe calls
    var nameLength = authorName?.length
    println(nameLength)
    //let() 函数
    /* 
    authorName?.let {
        nonNullableAuthor = authorName
    }*/
    //var mustHaveResult = nullableInt ?: 0









}