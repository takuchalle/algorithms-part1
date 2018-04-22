//
//  UnionFind.swift
//  week1
//
//  Created by Takuya OHASHI on 2018/04/21.
//

import Foundation

protocol UnionFindProtocol {
    init(num: Int)
    mutating func connected(_ p: Int,_ q:Int) -> Bool
    mutating func union(_ p: Int,_ q:Int)
}
