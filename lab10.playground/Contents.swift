let task1 = [1,2,3,4,5]
let resultTask1 = task1.filter {
    $0 % 2 != 0
}.map{Double($0)}
print(resultTask1)
/////////////////////////////// /// //
let task2 = [["ali","ahmed","mohamed"],["yasmeen","mona"]]
let resultTask2 = task2.flatMap { $0 }
    .map {
        word in
        word.prefix(1).uppercased() + word.dropFirst()
    }
print(resultTask2)
//////////////////////////////////////////
let task3 = [10,20,30]
let resultTask3 = task3.map {
    "\($0 * 10)"
}
print(resultTask3)
//////////////////////////////////////////
let task4 = ["10","20","30"]
let resultTask4 = task4.compactMap {
    Int($0)
}.reduce(1, *)
print(resultTask4)
