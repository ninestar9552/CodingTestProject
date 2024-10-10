//
//  solution_v3.swift
//  DotGame
//
//  Created by cha on 10/10/24.
//

import Foundation

// maxY값을 피타고라스 정리를 통해 계산
func solution3(_ k: Int, _ d: Int) -> Int64 {
    var totalPoints: Int64 = 0
    let dSquared = Int64(d) * Int64(d)
    
    // x 값을 k 단위로 증가시켜 가능한 y 값을 계산
    for x in stride(from: 0, through: d, by: k) {
        let xSquared = Int64(x) * Int64(x)
        
        // 가능한 y 값의 최대 값 계산
        let maxYSquared = dSquared - xSquared
        
        if maxYSquared >= 0 {
            let maxY = Int64(sqrt(Double(maxYSquared)))
            
            // y 값은 k 단위로 움직이므로, 가능한 y 값의 개수는 (maxY / k) + 1
            totalPoints += (maxY / Int64(k)) + 1
        }
    }
    
    return totalPoints
}
