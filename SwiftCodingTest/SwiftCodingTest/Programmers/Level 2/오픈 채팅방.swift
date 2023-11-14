import Foundation

func solution(_ record:[String]) -> [String] {
    var nickname = [String: String]()
    var orders = [[String]]()
    var result = [String]()
    
    for r in record {
        let temp = r.split(separator: " ").map { String($0) }
        if temp[0] != "Leave" {
            nickname[temp[1]] = temp[2]
        }
        orders.append([temp[0], temp[1]])
    }
    
    for order in orders {
        if order[0] == "Enter" {
            result.append("\(nickname[order[1]]!)님이 들어왔습니다.")
        } else if order[0] == "Leave"{
            result.append("\(nickname[order[1]]!)님이 나갔습니다.")
        }
    }
    
    return result
}
