import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let total = brown + yellow
    var width = 3
    while true {
        if total % width != 0 {
            width += 1
            continue
        }
        
        let height = total / width
        
        if yellow == (width-2)*(height-2) {
            var temp = [width, height]
            temp.sort(by: >)
            return temp
        }
        
        width += 1
    }
}
