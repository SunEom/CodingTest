import Foundation

func transToMin(_ time:String ) -> Int {
    let t = time.split(separator:":").map { Int(String($0))! }
    return t[0] * 60 + t[1]
}

func solution(_ book_time:[[String]]) -> Int {
    let book_time = book_time.sorted { $0[1] < $1[1] }.map{ $0.map { transToMin($0)}}
    var result = 0
    print(book_time)
    for i in 0..<book_time.count {
        var cnt = 1
        for j in i+1..<book_time.count {
            if book_time[j][0] < book_time[i][1]+10 {
                cnt += 1
            }
        }
        result = max(result, cnt)
    }
    
    return result
}
