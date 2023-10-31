import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    
    var minLen = 1111111
    var result = (0,0)
    
    var l = 0, r = 0, s = sequence[0]
    
    while r < sequence.count {
        if s == k {
            let len = r - l + 1
            if len < minLen {
                minLen = len
                result = (l, r)
            }
            s -= sequence[l]
            l += 1
        } else if s < k {
            r += 1
            if r >= sequence.count {
                break
            }
            s += sequence[r]
        } else {
            s -= sequence[l]
            l += 1
        }

    }
    
    return [result.0, result.1]
}
