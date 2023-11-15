func transToMin(_ str: String) -> Int {
    let t = str.split(separator:":").map { Int($0)! }
    return t[0]*60 + t[1]
}

func getMelodyListString(_ melody: String) -> String {
    let m = Array(melody).map { String($0) }
    var idx = 0
    var result = [String]()
    
    while idx < m.count {
        if idx < m.count-1 {
            if m[idx+1] == "#" {
                result.append(m[idx]+m[idx+1])
                idx += 2
            } else {
                result.append(m[idx])
                idx += 1
            }
        } else {
            result.append(m[idx])
            idx += 1
        }
    }
    return result.joined(separator:".")+"."
}

func getMelodyList(_ melody: String) -> [String] {
    let m = Array(melody).map { String($0) }
    var idx = 0
    var result = [String]()
    
    while idx < m.count {
        if idx < m.count-1 {
            if m[idx+1] == "#" {
                result.append(m[idx]+m[idx+1])
                idx += 2
            } else {
                result.append(m[idx])
                idx += 1
            }
        } else {
            result.append(m[idx])
            idx += 1
        }
    }
    return result
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    let m = getMelodyListString(m)
    
    let musicinfos = musicinfos.map { $0.split(separator:",").map { String($0) } }.sorted {
        let runningTime1 = transToMin($0[1]) - transToMin($0[0])
        let runningTime2 = transToMin($1[1]) - transToMin($1[0])
        
        if runningTime1 != runningTime2 {
            return runningTime1 > runningTime2
        } else {
            return transToMin($0[0]) <= transToMin($1[0])
        }
    }
    
    for musicinfo in musicinfos {
        let timeDiff = transToMin(musicinfo[1]) - transToMin(musicinfo[0])
        var temp = [String]()
        let melodyList = getMelodyList(musicinfo[3])
    
        var idx = 0
        
        while temp.count < timeDiff {
            temp.append(melodyList[idx])
            idx += 1
            idx %= melodyList.count
        }
        
        let melodyListStr = getMelodyListString(temp.joined())
        
        if melodyListStr.contains(m){
            return musicinfo[2]
        }
        
    }
    
    return "(None)"
}
