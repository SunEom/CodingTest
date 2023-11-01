import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    let data = data.sorted {
        if $0[col-1] == $1[col-1] {
            return $0[0] > $1[0]
        } else {
            return $0[col-1] < $1[col-1]
        }
    }
    
    var li = [Int]()
    for i in row_begin...row_end {
        let t = data[i-1].reduce (0) {
            return $0 + $1%i
        }
        li.append(t)
    }
    var result = 0
    
    for k in li {
        result ^= k
    }
    
    return result
}
