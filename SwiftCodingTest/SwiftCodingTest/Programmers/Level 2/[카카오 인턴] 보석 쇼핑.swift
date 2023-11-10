import Foundation

func solution(_ gems:[String]) -> [Int] {
    var result = [Int]()
    var minLen = 100001
    let cnt = Set(gems).count
    var left = 0, right = 0
    var s = [gems[0]: 1]
    var jCnt = 1

    while right < gems.count {
        if jCnt == cnt {
            if right - left + 1 < minLen {
                minLen = right - left + 1
                result = [left+1, right+1]
            }
            
            if s[gems[left]]! == 1 {
                jCnt -= 1
            }
            
            s[gems[left]]! -= 1
            left += 1
        } else {
            right += 1
            
            if right >= gems.count {
                break
            }
            
            if s[gems[right]] == nil || s[gems[right]]! == 0 {
                s[gems[right]] = 1
                jCnt += 1
            } else {
                s[gems[right]]! += 1
            }
        }
    }
    
    return result
}
