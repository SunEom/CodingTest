func solution(_ s:String) -> String {
    
    var result = ""
    var head = true
    
    for c in s {
        let c = String(c)
        if c == " " {
            head = true
            result += c
        } else {
            if head {
                result += c.uppercased()
                head = false
            } else {
                result += c.lowercased()
            }
        }
    }
    
    return result
}
