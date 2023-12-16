import Foundation

let pw = readLine()!.split(separator: " ").map { Int(String($0))! }
let (p, w) = (pw[0], pw[1])
let cv = readLine()!.split(separator: " ").map { Int(String($0))! }
let (c, v) = (cv[0], cv[1])
var parent = Array(0...p)

func find(_ s: Int) -> Int {
    if parent[s] == s {
        return s
    } else {
        return find(parent[s])
    }
}

func union(_ a: Int, _ b: Int) {
    let (aset, bset) = (find(a), find(b))
    
    if aset > bset {
        parent[aset] = bset
    } else {
        parent[bset] = aset
    }
}

var edges = [[Int]]()

for _ in 0..<w {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges.append(temp)
}

edges.sort{ $0[2] > $1[2] }

for e in edges {
    if find(e[0]) != find(e[1]) {
        union(e[0], e[1])
    }

    if find(c) == find(v) {
        print(e[2])
        break
    }
    
}
