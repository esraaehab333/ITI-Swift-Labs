// calculate the power
func calcPowerRecursion(b base:Int, p power:Int)->Int{
    if power == 0{
        return 1
    }
    return base * calcPowerRecursion(b: base, p: power-1)
}
print("the 2 power 8 is \(calcPowerRecursion(b: 2, p: 8))")
func calcPowerLoop(b base:Int , p power:Int)->Int{
    var result = 1
    for _ in 1...power{
        result = result*base
    }
    return result
}
print("the 2 power 8 is \(calcPowerLoop(b: 2, p: 8))")
