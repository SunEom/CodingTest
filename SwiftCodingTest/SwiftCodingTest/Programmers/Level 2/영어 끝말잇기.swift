import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var result = [0, 0]
    var prev = words[0]
    var dict = [String: Bool]()
    dict[prev] = true
    
    for i in 1..<words.count {
        let word = words[i]
        
        if dict[word] != nil || prev.last! != word.first! {
            result = [i%n+1, i/n+1]
            break
        }
        
        dict[word] = true
        prev = word
    }
    
    return result
}
