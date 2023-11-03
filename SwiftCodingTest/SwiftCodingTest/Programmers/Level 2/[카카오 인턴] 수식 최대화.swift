import Foundation

var result:Int64 = 0

func calc(_ oper: String, _ a: Int, _ b: Int) -> Int {
    switch oper {
        case "+":
            return a+b
        case "-":
            return a-b
        case "*":
            return a*b
        default:
            return 0
    }
}

func solution(_ expression:String) -> Int64 {
    let expression = Array(expression).map { String($0) }
    let priorities = [["+":0, "*":1, "-":2], ["+":0, "-":1, "*":2], ["-":0, "*":1, "+":2], ["-":0, "+":1, "*":2], ["*":0, "+":1, "-":2], ["*":0, "-":1, "+":2]]
    var operators = [String]()
    var nums = [Int]()
    var temp = 0
    
    for e in expression {
        if e == "*" || e == "+" || e == "-" {
            operators.append(e)
            nums.append(temp)
            temp = 0
        } else {
            temp *= 10
            temp += Int(e)!
        }
    }
    nums.append(Int(temp))
    
    for priority in priorities {
        bt(nums, operators, priority)
    }
    
    return result
}

func bt(_ nums: [Int],_ operators:[String],_ priority:[String:Int]){
    if nums.count == 2 {
        let r = calc(operators[0], nums[0], nums[1])
        result = max(result, Int64(abs(r)))
    } else {
        var tnums = nums
        var toper = operators
        var maxIdx = 0
        var maxPri = priority[toper[0]]!
        
        for i in 0..<toper.count {
            if maxPri < priority[toper[i]]! {
                maxPri = priority[toper[i]]!
                maxIdx = i
            }
        }
        
        let t = calc(toper[maxIdx], tnums[maxIdx], tnums[maxIdx+1])
        
        tnums.remove(at:maxIdx)
        tnums.remove(at:maxIdx)
        tnums.insert(t, at: maxIdx)
        toper.remove(at:maxIdx)
        
        bt(tnums, toper, priority)
        
    }
}
