import Foundation

let nm = readLine()!.split(separator:" ").map { Int(String($0))! }
let n = nm[0], m = nm[1]

let times = readLine()!.split(separator:" ").map { Int(String($0))! }

if n <= m {
    print(n)
} else {
    var left = 0, right = 60_000_000_000

    var time = 0

    while left <= right {
        let mid = (left + right)/2
        var s = 0
        
        times.forEach {
            s += mid/$0 + 1
        }
        
        if s >= n {
            time = mid
            right = mid-1
        } else {
            left = mid + 1
        }
    }

        
    var s = 0
    times.forEach {
        s += (time-1)/$0 + 1
    }
    print(time,s)

    for i in 0..<times.count {
        if time%times[i] == 0 {
            s += 1
        }
        if s == n {
            print(i+1)
            break
        }
    }
}


