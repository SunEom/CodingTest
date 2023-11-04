import Foundation


func solution(_ numbers:[Int], _ target:Int) -> Int {
    return bt(numbers, 0, 0, target)
}

func bt(_ numbers:[Int], _ idx: Int, _ num: Int, _ target: Int) -> Int {
    if idx == numbers.count {
        if num == target {
            return 1
        }
        return 0
    }
    
    return bt(numbers, idx+1, num + numbers[idx], target) + bt(numbers, idx+1, num - numbers[idx], target)
}

