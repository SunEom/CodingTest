import Foundation

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr = [[Int]]()
    var visited = Array(repeating: false, count: n)
    var minValue = Double(Int.max)
    var xsum = 0
    var ysum = 0
    
    for _ in 0..<n {
        let t = readLine()!.split(separator: " ").map { Int(String($0))! }
        arr.append(t)
        xsum += t[0]
        ysum += t[1]
    }
    
    func search(_ visitedIdx: [Int]) {
        
        if visitedIdx.count == n/2 {
            var x = 0, y = 0
            
            for idx in visitedIdx {
                x += arr[idx][0]
                y += arr[idx][1]
            }
            
            let tx = xsum - x, ty = ysum - y
            
            let dist = sqrt(Double((x-tx)*(x-tx) + (y-ty)*(y-ty)))
            
            minValue = min(minValue, dist)
            
            return
        }
        
        let firstIdx = visitedIdx.count == 0 ? 0 : visitedIdx.last!+1
        
        for i in firstIdx..<n {
            if visited[i] == false {
                visited[i] = true
                var temp = visitedIdx
                temp.append(i)
                search(temp)
                visited[i] = false
            }
        }
        
        
    }
    
    search([])
    
    result += "\(minValue)\n"
}

print(result)
