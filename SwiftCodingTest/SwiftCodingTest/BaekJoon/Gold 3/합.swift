import Foundation

let n = Int(readLine()!)!

var dict = [Character: Int]()
var value = [Character: Int]()
var front = Set<Character>()

for _ in 0..<n {
    let str = Array(readLine()!)
    
    var i = 1

    front.insert(str[0])
    
    for c in stride(from: str.count-1, through: 0, by: -1) {
        if dict[str[c]] == nil {
            dict[str[c]] = i
        } else {
            dict[str[c]]! += i
        }
        i *= 10
    }
}

if dict.count == 10 {
    for (key,_) in dict.sorted(by: {$0.value < $1.value}) where !front.contains(key) {
        dict[key] = nil
        break
    }
}

var result = 0
var num = 9
for key in dict.keys.sorted { dict[$0]! > dict[$1]! } {
    result += num*dict[key]!
    num -= 1
}

print(result)
