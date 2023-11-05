import Foundation

func solution(_ number:String, _ k:Int) -> String {
    let number = Array(number).map{ String($0) }
    var stack = [String]()
    var cnt = k
    var idx = 0
    while idx < number.count {
        if stack.count == 0 {
            stack.append(number[idx])
        } else {
            while stack.count > 0 && stack.last! < number[idx] && cnt > 0{
                stack.removeLast()
                cnt -= 1
            }
            stack.append(number[idx])
        }
        idx += 1
    }
    
    while cnt > 0 {
        stack.removeLast()
        cnt -= 1
    }
    
    return stack.joined()
}
