import Foundation

let nm = readLine()!.split(separator : " ").map{ Int(String($0))! }
let n = nm[0], m = nm[1]
var parent = Array(0...n)

func find(_ s: Int) -> Int {
    if parent[s] == s {
        return s
    } else {
        return find(parent[s])
    }
}

func union(_ a: Int, _ b: Int) {
    let aset = find(a)
    let bset = find(b)
    
    if aset > bset {
        parent[aset] = bset
    } else {
        parent[bset] = aset
    }
}

func getDist(_ a: [Int], _ b: [Int]) -> Double {
    return sqrt( pow(Double(a[0]-b[0]), 2) + pow(Double(a[1]-b[1]), 2) )
}

var pos = [[Int]]()

for _ in 0..<n {
    pos.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

var arr = [(Int, Int, Double)]()

for i in 1..<n {
    for j in i+1...n{
        arr.append((i, j, getDist(pos[i-1], pos[j-1])))
    }
}

arr.sort{ $0.2 < $1.2 }

for _ in 0..<m {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    union(t[0], t[1])
}

var result = 0.0

for a in arr {
    if find(a.0) != find(a.1) {
        result += a.2
        union(a.0, a.1)
    }
}

print(String(format: "%.2f", result))
