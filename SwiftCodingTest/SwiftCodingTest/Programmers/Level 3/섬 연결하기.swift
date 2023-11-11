import Foundation

var parents = [Int]()

func find(_ a: Int) -> Int {
    if parents[a] == a {
        return a
    } else {
        return find(parents[a])
    }
}

func union(_ a: Int,_ b: Int) {

    let aSet = find(a)
    let bSet = find(b)
    
    if aSet > bSet {
        parents[aSet] = bSet
    } else {
        parents[bSet] = aSet
    }
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result = 0
    let costs = costs.sorted { $0[2] < $1[2] }
    parents = Array(0...n)
    
    for cost in costs {
        if find(cost[0]) != find(cost[1]) {
            union(cost[0], cost[1])
            result += cost[2]
        }
    }
    
    return result
}
