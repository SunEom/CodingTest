import Foundation

var chars = ["A","E","I","O","U"]
var list = [String]()

func bt(_ str: String) {
    list.append(str)
    
    if str.count == 5 {
        return
    }
    
    for c in chars {
        bt(str + c)
    }
}

func solution(_ word:String) -> Int {
    bt("")
    return Int(list.firstIndex(of: word)!)
}
