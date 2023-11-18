import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict = [String:Int]()
    
    for cloth in clothes {
        if dict[cloth[1]] == nil {
            dict[cloth[1]] = 1
        } else {
            dict[cloth[1]]! += 1
        }
    }
    
    var result = 1
    
    for (_, value) in dict  {
        result *= (value + 1)
    }
    
    return result - 1
}
