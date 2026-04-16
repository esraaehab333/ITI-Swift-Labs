// factorial function
func getFactorial(number:Int) -> Int{
    var ans = 1
    for index in 1...number{
        ans = ans * index
    }
    return ans
}
print("factorial number 5 is \(getFactorial(number: 5))")
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
// sorting
func sortArray(arr: [Int])->[Int]{
    var arr = arr
    for i in 0..<arr.count{
        for j in 0..<arr.count-i-1{
            if arr[j] > arr[j + 1]{
                let temp = arr[ j ]
                arr[j] = arr[j + 1]
                arr[j + 1] = temp
            }
        }
    }
    return arr
}
print(sortArray(arr: [1,2,8,4,3,6]))
