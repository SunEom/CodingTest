import Foundation


let minMax = readLine()!.split(separator: " ").map { Int(String($0))! }
let minValue = minMax[0], maxValue = minMax[1]
var arr = Array(repeating:false, count: 1000001)


var i = 2

while i*i <= maxValue {
    var n = minValue / (i*i)
    
    if minValue % (i*i) != 0 { n += 1 }
    
    while n*i*i <= maxValue {
        arr[n*i*i-minValue] = true
        n += 1
    }
    
    i += 1
}

var result = 0

for i in 0...maxValue-minValue {
    if !arr[i] {
        result += 1
    }
}

print(result)
