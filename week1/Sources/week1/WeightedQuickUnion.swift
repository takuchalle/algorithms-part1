//
//  WeightedQuickUnion.swift
//  Commander
//
//  Created by Takuya OHASHI on 2018/04/21.
//

import Foundation

struct WeightedQuickUnion: UnionFindProtocol {
    var N: [Int]
    var sz: [Int]
    init(num: Int) {
        N = [Int](repeating: 0, count: num)
        sz = [Int](repeating: 1, count: num)
        for id in 0..<N.count {
            N[id] = id
        }
    }
    
    func root(_ i: Int) -> Int {
        var _i = i
        while(_i != N[_i]) { _i = N[_i] }
        return _i
    }
    
    func connected(_ p: Int,_ q:Int) -> Bool {
        return root(p) == root(q)
    }
    
    mutating func union(_ p: Int,_ q:Int) {
        let i = root(p)
        let j = root(q)
        if(sz[i] >= sz[j]) {
            N[j] = i
            sz[i] += sz[j]
        } else {
            N[i] = j
            sz[j] += sz[i]
        }
    }
}
