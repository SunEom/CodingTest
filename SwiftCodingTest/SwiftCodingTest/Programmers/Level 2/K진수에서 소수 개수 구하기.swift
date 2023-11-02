import Foundation

var primeDict = [Int: Bool]()

func trans(_ n: Int, _ k: Int) -> [Int] {
    var result = [Int]()
    var num = n
    while num != 0 {
        result.append(num%k)
        num /= k
    }
    
    return Array(result.reversed())
}

func isPrime(_ n: Int) -> Bool {
    if n == 0 || n == 1 {
        return false
    }
    
    if primeDict[n] != nil {
        return primeDict[n]!
    } else {
        for i in stride(from: 2, through: Int(sqrt(Double(n))), by: 1) {
            if n % i == 0 {
                primeDict[n] = false
                return false
            }
        }
        primeDict[n] = true
        return true
    }
}

func solution(_ n:Int, _ k:Int) -> Int {
    var num = 0
    var result = 0
    var change = trans(n, k)
    
    for p in change {
        if p != 0 {
            num *= 10
            num += p
        } else {
            if isPrime(num) {
                result += 1
            }
            num = 0
        }
    }
    
    if num != 0 {
        if isPrime(num) {
            result += 1
        }
    }
    
    return result
}
