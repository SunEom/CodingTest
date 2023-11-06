import Foundation

var visited = [Bool]()
var result = Set<Int>()

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    } else  {
        for i in stride(from: 2, through:Int(sqrt(Double(n))), by: 1) {
            if n % i == 0 {
                return false
            }
        }
        
        return true
    }
}


func solution(_ numbers:String) -> Int {
    let numbers = numbers.map { Int(String($0))! }
    visited = Array(repeating:false, count: numbers.count)
    
    bt(0, numbers, 0)
    
    print(result)
    
    return result.count
}

func bt(_ len: Int, _ numbers: [Int], _ num: Int){
    if isPrime(num) {
        result.insert(num)
    }
    
    if len < numbers.count {
        for i in 0..<numbers.count {
            if visited[i] == false {
                visited[i] = true
                bt(len+1, numbers, num * 10 + numbers[i])
                visited[i] = false
            }
        }
    }
}
