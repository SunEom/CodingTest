func solution(_ msg:String) -> [Int] {
    var dict = [String: Int]()
    var idx = 1
    var last = 27
    var result = [Int]()
    for c in "ABCDEFGHIJKLMNOPQRSTUVWXYZ"{
        dict[String(c)] = idx
        idx += 1
    }
    var str = ""
    
    for c in msg {
        let c = String(c)
        
        if str == ""{
            str += c
        } else {
            if dict[str+c] != nil {
                str += c
            } else {
                result.append(dict[str]!)
                dict[str+c] = last
                str = c
                last += 1
            }
        }
    }
    
    if str != "" {
        if dict[str] == nil {
            result.append(last)
        } else {
            result.append(dict[str]!)
        }
    }
    return result
}
