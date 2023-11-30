import Foundation

let n = Int(readLine()!)!
var prime = Array(repeating: true, count: n+1)
var primeList = [Int]()
var result = 0

prime[0] = false
prime[1] = false


for i in stride(from:2, to: n+1, by: 1) {
    if prime[i] == false {
        continue
    }
    
    primeList.append(i)
    
    for k in stride(from:2*i, to: n+1, by: i) {
        prime[k] = false
    }
}

var left = 0, right = 0

if n > 1 {
    var s = primeList[0]

    while left <= right {
        if s < n {
            right += 1
            if right >= primeList.count {
                break
            }
            
            s += primeList[right]
        } else if s > n {
            s -= primeList[left]
            left += 1
            if left > right {
                break
            }
        } else {
            
            result += 1
            s -= primeList[left]
            left += 1
        }
    }
}


print(result)
