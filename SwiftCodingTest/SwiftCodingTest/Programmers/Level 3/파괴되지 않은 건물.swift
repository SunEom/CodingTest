import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    var board = board
    var temp = Array(repeating: Array(repeating: 0, count: board[0].count+1), count: board.count+1)
    var result = 0
    
    for s in skill {
        var k = s[0] == 1 ? -s[5] : s[5]
        let sr = s[1], sc = s[2], er = s[3], ec = s[4]
        
        temp[sr][sc] += k
        temp[sr][ec+1] -= k
        temp[er+1][sc] -= k
        temp[er+1][ec+1] += k
    }
    
    
    for i in 1..<temp.count {
        for j in 0..<temp[0].count {
            temp[i][j] += temp[i-1][j]
        }
    }
    
    for i in 0..<temp.count {
        for j in 1..<temp[0].count {
            temp[i][j] += temp[i][j-1]
        }
    }
    
    for r in 0..<board.count {
        for c in 0..<board[0].count {
            board[r][c] += temp[r][c]
            if board[r][c] > 0 {
                result += 1
            }
        }
    }
    
    return result
}
