import Foundation

let s = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var value = [Character: Int]()
var i = 1

var li = [[Int]]()
var result = 0
for c in s {
    value[c] = i
    i += 1
}

let n = Int(readLine()!)!
var arr = [[Character]]()
var parent = Array(0..<n)

for i in 0..<n {
    let temp = Array(readLine()!)
    arr.append(temp)
    
    for j in 0..<n {
        if temp[j] != "0" {
            result += value[temp[j]]!
            li.append([i, j, value[temp[j]]!])
        }
    }
}

li.sort { $0[2] < $1[2] }

func find(_ s: Int) -> Int {
    if parent[s] == s {
        return parent[s]
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

var sumValue = 0
for item in li {
    let (a, b, c) = (item[0], item[1], item[2])
    
    if find(a) != find(b) {
        union(a, b)
        result -= c
    }
}

for i in 0..<n {
    if find(0) != find(i) {
        result = -1
        break
    }
}

print(result)
