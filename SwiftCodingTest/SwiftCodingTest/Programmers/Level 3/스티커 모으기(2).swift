import Foundation

func solution(_ sticker:[Int]) -> Int{
    var answer = 0

    if sticker.count > 2 {
        var dp1 = Array(repeating: 0, count:sticker.count)
        var dp2 = Array(repeating: 0, count:sticker.count)

        dp1[0] = sticker[0]
        dp1[1] = dp1[0]

        dp2[1] = sticker[1]
        
        for i in 2..<sticker.count {
            if i < sticker.count-1 {
                dp1[i] = max(dp1[i-1], dp1[i-2] + sticker[i])
            }

            dp2[i] = max(dp2[i-1], dp2[i-2] + sticker[i])
        }

        return max(dp1.max()!, dp2.max()!)
    } else {
        return sticker.max()!
    }


    
}
