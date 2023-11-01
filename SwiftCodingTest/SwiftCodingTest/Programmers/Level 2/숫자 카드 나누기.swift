import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if a == b {
        return a
    } else if a > b {
        if a % b == 0 {
            return b
        } else {
            return gcd(a%b, b)
        }
    } else {
        if b % a == 0 {
            return a
        } else {
            return gcd(b, b%a)
        }
    }
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var gcd1 = arrayA[0], gcd2 = arrayB[0]
    var result = 0
    
    for n in arrayA {
        gcd1 = gcd(gcd1, n)
    }
    
    for n in arrayB {
        gcd2 = gcd(gcd2, n)
    }
    
    
    for k in stride(from: gcd1, to:0, by:-1) {
        var success = true
        if gcd1 % k != 0 {
            continue
        }
        
        for n in arrayB {
            if n % k == 0 {
                success = false
                break
            }
        }
        
        if success {
            result = max(result, k)
        }
    }
    
    for k in stride(from: gcd2, to:0, by:-1) {
        var success = true
        if gcd2 % k != 0 {
            continue
        }
        
        for n in arrayA {
            if n % k == 0 {
                success = false
                break
            }
        }
        
        if success {
            result = max(result, k)
        }
    }
    
    return result
}
