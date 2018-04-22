//
//  QuickUnion.swift
//  Commander
//
//  Created by Takuya OHASHI on 2018/04/21.
//

import Foundation

struct QuickUnion: UnionFindProtocol {
    var N: [Int]
    let size: Int
    init(num: Int) {
        N = [Int](repeating: 0, count: num)
        for id in 0..<N.count {
            N[id] = id
        }
        size = num
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
        N[i] = j
    }
}
