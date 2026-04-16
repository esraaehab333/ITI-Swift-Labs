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
