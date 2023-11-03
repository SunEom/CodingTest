import Foundation

func isAvail(_ arr : [String]) -> Bool {
    var stack = [String]()
    
    for s in arr {
        if s == "[" || s == "{" || s == "(" {
            stack.append(s)
        } else {
            if s == "]" {
                if stack.count == 0 {
                    return false
                } else {
                    let p = stack.removeLast()
                    
                    if p != "[" {
                        return false
                    }
                    
                }
            } else if s == "}" {
                if stack.count == 0 {
                    return false
                } else {
                    let p = stack.removeLast()
                    
                    if p != "{" {
                        return false
                    }
                    
                }
            } else if s == ")" {
                if stack.count == 0 {
                    return false
                } else {
                    let p = stack.removeLast()
                    
                    if p != "(" {
                        return false
                    }
                    
                }
            }
        }
    }
    
    if stack.count != 0 {
        return false
    } else {
        return true
    }
}

func solution(_ s:String) -> Int {
    
    let arr = Array(s).map { String($0) }
    var result = 0
    
    for i in 0..<arr.count {
        let temp = Array(arr[i..<arr.count] + arr[0..<i])
        if isAvail(temp) {
            result += 1
        }
    }
    
    return result
}
