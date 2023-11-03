import Foundation

func cnt(_ arr: [[Int]], _ sr: Int, _ sc: Int, _ er: Int, _ ec: Int) -> [Int] {
    if (sr, sc) == (er, ec) {
        if arr[sr][sc] == 0 {
            return [1, 0]
        } else {
            return [0, 1]
        }
    } else {
        let t1 = cnt(arr, sr, sc, (sr+er)/2, (sc+ec)/2)
        let t2 = cnt(arr, (sr+er)/2+1, sc, er, (sc+ec)/2)
        let t3 = cnt(arr, sr, (sc+ec)/2+1, (sr+er)/2, ec)
        let t4 = cnt(arr, (sr+er)/2+1, (sc+ec)/2+1, er, ec)
        
        let temp = [t1[0]+t2[0]+t3[0]+t4[0], t1[1]+t2[1]+t3[1]+t4[1]]
        
        if temp[0] == 0 {
            return [0, 1]
        } else if temp[1] == 0 {
            return [1, 0]
        } else {
            return temp
        }
    }
}

func solution(_ arr:[[Int]]) -> [Int] {
    return cnt(arr, 0, 0, arr.count-1, arr.count-1)
}
