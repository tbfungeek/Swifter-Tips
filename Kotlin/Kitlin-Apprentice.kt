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

    //Byte Short Int Long Float Double Char String Any Unit Nothing
}