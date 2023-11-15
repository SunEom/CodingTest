import Foundation

class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodeinfo = nodeinfo.enumerated().map { $1 + [$0+1] }.sorted{ $0[0] < $1[0]}
    
    func bs(_ s: Int, _ e: Int) -> Node? {
        if s > e { return nil }
        if s == e { return Node(value:nodeinfo[s][2]) }
        var maxH = -1
        var maxIdx = -1
        
        for i in s...e {
            if nodeinfo[i][1] > maxH {
                maxH = nodeinfo[i][1]
                maxIdx = i
            }
        }
        
        var node = Node(value:nodeinfo[maxIdx][2])
        
        node.left = bs(s, maxIdx-1)
        node.right = bs(maxIdx+1, e)
        
        return node
    }
    
    let root = bs(0, nodeinfo.count-1)!
    var pre = [Int](), post = [Int]()
    
    func preorder(_ r: Node) {
        pre.append(r.value)
        if let left = r.left {
            preorder(left)
        }
        if let right = r.right {
            preorder(right)
        }
    }
    
    func postorder(_ r: Node) {
        if let left = r.left {
            postorder(left)
        }
        if let right = r.right {
            postorder(right)
        }
        post.append(r.value)
    }
    
    preorder(root)
    postorder(root)
    
    return [pre, post]
}
