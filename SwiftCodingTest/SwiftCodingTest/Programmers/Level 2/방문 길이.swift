//
//  방문 길이.swift
//  SwiftCodingTest
//
//  Created by 엄태양 on 11/4/23.
//

import Foundation
import Foundation

func solution(_ dirs:String) -> Int {
    
    let dirs = Array(dirs).map { String($0) }
    
    let direction = ["U":[1,0], "D":[-1, 0], "R":[0,1], "L":[0,-1]]
    
    var now = [0, 0]
    
    var visited = Set<[Int]>()
    
    
    for dir in dirs {
        let d = direction[dir]!
        let tr = now[0] + d[0], tc = now[1] + d[1]
        
        if (-5...5).contains(tr) && (-5...5).contains(tc) {
            visited.insert([now[0], now[1], tr, tc])
            visited.insert([tr, tc, now[0], now[1]])
            now = [tr, tc]
        }
        
    }
    
    return visited.count/2
}
