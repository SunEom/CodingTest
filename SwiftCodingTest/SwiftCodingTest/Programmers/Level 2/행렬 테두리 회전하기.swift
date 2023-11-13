import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var result = [Int]()
    var arr = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var num = 1
    for i in 0..<rows {
        for j in 0..<columns {
            arr[i][j] = num
            num += 1
        }
    }
    
    for query in queries {
        let sr = query[0]-1, sc = query[1]-1, er = query[2]-1, ec = query[3]-1
        var minValue = arr[sr][sc]
        var temp = arr[sr][sc]
        
        for i in sc+1...ec {
            let temp2 = arr[sr][i]
            minValue = min(minValue , temp2)
            arr[sr][i] = temp
            temp = temp2
        }
        
        for i in sr+1...er {
            let temp2 = arr[i][ec]
            minValue = min(minValue , temp2)
            arr[i][ec] = temp
            temp = temp2
        }
        
        for i in stride(from: ec-1, through: sc, by:-1) {
            let temp2 = arr[er][i]
            minValue = min(minValue , temp2)
            arr[er][i] = temp
            temp = temp2
        }
        
        for i in stride(from: er-1, through: sr, by:-1) {
            let temp2 = arr[i][sc]
            minValue = min(minValue , temp2)
            arr[i][sc] = temp
            temp = temp2
        }
        
        result.append(minValue)
    }
    return result
}
