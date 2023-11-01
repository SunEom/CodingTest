import Foundation

func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    }
    
    var result = 1
    
    for i in stride(from: n, through:1, by:-1) {
        result *= i
    }
    return result
}

func solution(_ weights:[Int]) -> Int64 {
    var result:Int64 = 0
    
    let weights = weights.sorted()
    var cnt = Array(repeating:Int64(0), count: 2001)
    
    for w in weights {
        cnt[w] += 1
    }
    
    let s = Array(Set(weights)).sorted()
    
    for item in s {
        
        if cnt[item] > 1 {
            result += cnt[item] * (cnt[item]-1) / 2
        }
        
        if item % 2 == 0 {
            result += cnt[item] * cnt[item/2*3]
        }
        
        if item % 3 == 0 {
            result += cnt[item] * cnt[item/3*4]
        }
        
        result += cnt[item] * cnt[item*2]
    
    }
    
    return result
}
