import Foundation

func solution(_ numbers:[Int]) -> String {
    var numbers = numbers.map { String($0) }
    numbers.sort { $0 + $1 > $1 + $0 }
    let str = numbers.joined()
    guard let num = Int(str) else { return str }
    return String(num)
}
