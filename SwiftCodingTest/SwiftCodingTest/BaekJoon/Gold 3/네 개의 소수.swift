import Foundation

let n = Int(readLine()!)!
var prime = Array(repeating: true, count: n+1)
var primeList = [Int]()

for i in stride(from: 2, through: n, by: 1) {
    if prime[i] {
        primeList.append(i)
        for j in stride(from: 2*i, through: n, by: i) {
            prime[j] = false
        }
    }
}

func check() {
    if n < 8 {
        print(-1)
        return
    }
    
    if n % 2 == 0 {
        for i in stride(from: 2, through: n, by: 1) {
            if prime[i] && prime[n-4-i] {
                print("2 2 \(i) \(n-4-i)")
                return
            }
        }
    } else {
        for i in stride(from: 2, through: n, by: 1) {
            if prime[i] && prime[n-5-i] {
                print("2 3 \(i) \(n-5-i)")
                return
            }
        }
    }
    print(-1)
}


check()
