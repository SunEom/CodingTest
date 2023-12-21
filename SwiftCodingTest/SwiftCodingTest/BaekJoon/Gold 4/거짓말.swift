import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var fact = Array(repeating: false, count: m)
var join = Array(repeating: [Int](), count: n+1)
var party = Array(repeating: [Int](), count: m)
var result = m

let t = readLine()!.split(separator: " ").map { Int(String($0))! }

for i in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    for k in temp[1...] {
        join[k].append(i)
    }
    party[i] = Array(temp[1...])
}

var queue = [Int]()

for v in t[1...] {
    for p in join[v] {
        if !fact[p] {
            fact[p] = true
            result-=1
            queue.append(p)
        }
    }
}


while queue.count > 0 {
    let pop = queue.removeFirst()
    
    for k in party[pop] {
        for p in join[k] {
            if !fact[p] {
                fact[p] = true
                result-=1
                queue.append(p)
            }
        }
    }
}


print(result)
