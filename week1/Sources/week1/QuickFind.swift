//
//  UF.swift
//  week1
//
//  Created by Takuya OHASHI on 2018/04/21.
//

import Foundation

struct QuickFind: UnionFindProtocol {
    var N: [Int]
    let size: Int
    init(num: Int) {
        N = [Int](repeating: 0, count: num)
        for id in 0..<N.count {
            N[id] = id
        }
        size = num
    }
    
    func connected(_ p: Int,_ q:Int) -> Bool {
        return N[p] == N[q]
    }
    
    mutating func union(_ p: Int,_ q:Int) {
        let pid = N[p]
        let qid = N[q]
        for id in 0..<N.count {
            if(N[id] == pid) { N[id] = qid }
        }
    }
}
