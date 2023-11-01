import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var indexStack = [Int]()
    var result = Array(repeating: -1, count: numbers.count)
    for i in 0..<numbers.count {
        if indexStack.count == 0 {
            indexStack.append(i)
        } else {
            while indexStack.count > 0 && numbers[indexStack.last!] < numbers[i] {
                let idx = indexStack.removeLast()
                result[idx] = numbers[i]
            }
            indexStack.append(i)
        }
    }
    
    return result
}
