import Foundation

func solution(_ n:Int) -> Int
{
    var result = 0
    var now = n
    
    while now != 0 {
        if now % 2 == 1 {
            now -= 1
            result += 1
        }
        
        now /= 2
    }
    
    return result
}
