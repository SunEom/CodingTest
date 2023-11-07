func solution(_ str1:String, _ str2:String) -> Int {
    
    let arr1 = Array(str1.lowercased()).map { String($0) }
    let arr2 = Array(str2.lowercased()).map { String($0) }
    
    var dict1 = [String: Int]()
    var dict2 = [String: Int]()
    let eng = "abcdefghijklmnopqrstuvwxyz"
    for i in 0..<arr1.count-1 {
        if !eng.contains(arr1[i]) || !eng.contains(arr1[i+1]) {
            continue
        }
        let t = arr1[i] + arr1[i+1]
        
        if dict1[t] != nil {
            dict1[t]! += 1
        } else {
            dict1[t] = 1
        }
    }
    
    for i in 0..<arr2.count-1 {
        if !eng.contains(arr2[i]) || !eng.contains(arr2[i+1]) {
            continue
        }
        
        let t = arr2[i] + arr2[i+1]
        
        if dict2[t] != nil {
            dict2[t]! += 1
        } else {
            dict2[t] = 1
        }
    }
    
    
    if dict1.count == 0 && dict2.count == 0 {
        return 65536
    } else {
        var inter = 0
        var union = 0
        var s = Set(Array(dict1.keys) + Array(dict2.keys))
        
        for item in s {
            if dict1[item] != nil && dict2[item] != nil {
                inter += min(dict1[item]!, dict2[item]!)
                union += max(dict1[item]!, dict2[item]!)
            } else if dict1[item] != nil {
                union += dict1[item]!
            } else {
                union += dict2[item]!
            }
        }
    
        return Int(Double(inter)/Double(union)*65536)
    }
}
