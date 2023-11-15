func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var board = board.map { Array($0).map { String($0) }}
    var remove = Set<[Int]>()
    var result = 0
    
    while true {
        remove = Set<[Int]>()
        
        for r in 0..<m-1 {
            for c in 0..<n-1 {
                if board[r][c] != "-" && board[r][c] == board[r][c+1] && board[r][c+1] == board[r+1][c] && board[r+1][c] == board[r+1][c+1] {
                    remove.insert([r,c])
                    remove.insert([r,c+1])
                    remove.insert([r+1,c])
                    remove.insert([r+1,c+1])
                }
            }
        }

        for p in remove {
            board[p[0]][p[1]] = "-"
        }

        for c in 0..<n {
            while true {
                var firstRemovedRow = -1
                var firstRemainRow = -1

                for r in stride(from:m-1, through:0, by:-1) {
                    if board[r][c] == "-" {
                        firstRemovedRow = r
                        break
                    }
                }

                if firstRemovedRow == -1 {
                    break
                }

                for r in stride(from:firstRemovedRow, through:0, by:-1) {
                    if board[r][c] != "-" {
                        firstRemainRow = r
                        break
                    }
                }

                if firstRemainRow == -1 {
                    break
                }

                board[firstRemovedRow][c] = board[firstRemainRow][c]
                board[firstRemainRow][c] = "-"
            }
        }
        
        result += remove.count
        
        if remove.count == 0 { break }
    }

    return result
}
