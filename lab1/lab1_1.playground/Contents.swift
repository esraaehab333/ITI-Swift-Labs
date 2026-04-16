// factorial function
func getFactorial(number:Int) -> Int{
    var ans = 1
    for index in 1...number{
        ans = ans * index
    }
    return ans
}
print("factorial number 5 is \(getFactorial(number: 5))")
