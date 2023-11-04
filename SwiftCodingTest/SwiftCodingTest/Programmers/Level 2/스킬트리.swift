import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var result = 0
    
    var parents = [String: String]()
    let skill = Array(skill).map { String($0) }
    
    for i in 1..<skill.count {
        parents[skill[i]] = skill[i-1]
    }
    
    for skill_tree in skill_trees {
        let st = Array(skill_tree).map { String($0) }
        var learn = [String: Bool]()
        
        var avail = true
        
        for s in st {
            if parents[s] == nil {
                learn[s] = true
            } else {
                if learn[parents[s]!] == nil {
                    avail = false
                    break
                } else {
                    learn[s] = true
                }
            }
        }
        
        if avail {
            result += 1
        }
    }
    
    return result;
}
