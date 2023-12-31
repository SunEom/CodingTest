// 파일 합치기

let t = Int(readLine()!)!
var result = ""
for _ in 0..<t {
    let k = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: k+1), count: k+1)
    let chapter = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
    var sum = chapter
    
    for i in 1...k { // 부분합 계산
        sum[i] += sum[i-1]
    }
    
    for d in 1..<k {
        for tx in 1...k-d {
            let ty = tx + d
            dp[tx][ty] = 50000000
            
            for m in tx..<ty {
                dp[tx][ty] = min(dp[tx][ty], dp[tx][m] + dp[m + 1][ty] + sum[ty] - sum[tx - 1]);
            }
        }
    }
    result += "\(dp[1][k])\n"
}

print(result)
