import Foundation

let n = Int(readLine()!)!
var li = [(Int, Int, Double)]()
var vertex = [[Double]]()
var parent = Array(0..<n)

func dist(_ a: [Double], _ b: [Double] ) -> Double {
    return sqrt(pow((a[0] - b[0]),2) + pow((a[1]-b[1]), 2))
}

func find(_ a: Int) -> Int {
    if parent[a] == a {
        return a
    } else {
        return find(parent[a])
    }
}

func union(_ a: Int, _ b: Int) {
    let aset = find(a)
    let bset = find(b)
    
    if aset > bset {
        parent[bset] = aset
    } else {
        parent[aset] = bset
    }
}



for _ in 0..<n {
    let t = readLine()!.split(separator:" ").map { Double(String($0))! }
    vertex.append(t)
}

for i in 0..<n {
    for j in i+1..<n {
        li.append((i, j, dist(vertex[i], vertex[j])))
    }
}

li.sort { $0.2 < $1.2 }

var result = 0.0

for l in li {
    if find(l.0) != find(l.1) {
        union(l.0, l.1)
        result += l.2
    }
}

print(result)
