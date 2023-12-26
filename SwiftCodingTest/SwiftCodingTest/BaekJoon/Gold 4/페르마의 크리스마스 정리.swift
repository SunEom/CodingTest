import Foundation
var result = ""

var prime = Array(repeating: true, count: 1_000_000)
var primeNum = [Int]()
prime[0] = false
prime[1] = false

for i in 2..<1_000_000 {
    if prime[i] == true {
        primeNum.append(i)
        for k in stride(from: 2*i, to: 1_000_000, by: i) {
            prime[k] = false
        }
    }
}

while true {
    let lu = readLine()!.split(separator : " ").map { Int(String($0))! }
    let (l, u) = (lu[0], lu[1])
    var (x, y) = (0, 0)
    
    if l == -1 && u == -1 {
        break
    }

    let (tl, tu) = (max(0, l), max(0, u))
    
    for n in primeNum {
        if n < tl {
            continue
        } else if n > tu {
            break
        }
        x += 1
        
        if n%4 == 1 || n == 2 {
            y += 1
        }
    }
    
    result += "\(l) \(u) \(x) \(y)\n"
}

print(result)
