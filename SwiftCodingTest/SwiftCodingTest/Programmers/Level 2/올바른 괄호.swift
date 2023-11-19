import Foundation

func solution(_ s:String) -> Bool
{
    var result = true
 
    var stack = [Character]()
    
    for c in s {
        if stack.count == 0 {
            stack.append(c)
            continue
        }
        
        if c == "(" || c == "[" || c == "{" {
            stack.append(c)
        } else if c == ")" {
            if stack.count == 0 || stack.last! != "(" {
                result = false
                break
            }
            stack.removeLast()
        } else if c == "]" {
            if stack.count == 0 || stack.last! != "[" {
                result = false
                break
            }
            stack.removeLast()
        } else if c == "}" {
            if stack.count == 0 || stack.last! != "{" {
                result = false
                break
            }
            stack.removeLast()
        }
        
    }
    
    if stack.count != 0 {
        result = false
    }
    
    return result
}
