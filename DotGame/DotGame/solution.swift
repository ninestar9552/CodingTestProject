//
//  soulution.swift
//  DotGame
//
//  Created by cha on 10/7/24.
//

/**
 https://school.programmers.co.kr/learn/courses/30/lessons/140107
 좌표평면을 좋아하는 진수는 x축과 y축이 직교하는 2차원 좌표평면에 점을 찍으면서 놀고 있습니다. 진수는 두 양의 정수 k, d가 주어질 때 다음과 같이 점을 찍으려 합니다.

 원점(0, 0)으로부터 x축 방향으로 a*k(a = 0, 1, 2, 3 ...), y축 방향으로 b*k(b = 0, 1, 2, 3 ...)만큼 떨어진 위치에 점을 찍습니다.
 원점과 거리가 d를 넘는 위치에는 점을 찍지 않습니다.
 예를 들어, k가 2, d가 4인 경우에는 (0, 0), (0, 2), (0, 4), (2, 0), (2, 2), (4, 0) 위치에 점을 찍어 총 6개의 점을 찍습니다.

 정수 k와 원점과의 거리를 나타내는 정수 d가 주어졌을 때, 점이 총 몇 개 찍히는지 return 하는 solution 함수를 완성하세요.
 */

import Foundation

/// - Parameters:
///   - k: 정수
///   - d: 원점과의 거리를 나타내는 정수
/// - Returns: 총 찍히는 점의 개수
/// - Note:
/// 1 ≤ k ≤ 1,000,000
/// 1 ≤ d ≤ 1,000,000

// Int형으로 처리시 signal: illegal instruction (core dumped) 오류가 발생 (Int값 오버플로우)
// Double형으로 처리시 시간초과
//func solution(_ k:Int, _ d:Int) -> Int64 {
//    var total: Int64 = 0
//    
//    let dd = Double(d)
//    let kd = Double(k)
//    
//    for a in 0...d {
//        print("a 순서: \(a)")
//        let ad = Double(a)
//        for b in 0...d {
//            print("b 순서: \(b) ::: \(a), \(b)")
//            let bd = Double(b)
//            if (ad*kd*ad*kd + bd*kd*bd*kd) <= dd*dd {
//                total += 1
//            } else {
//                break
//            }
//        }
//    }
//    
//    return total
//}

// 역순으로 처리시 더 오래걸림
//func solution(_ k:Int, _ d:Int) -> Int64 {
//    var total: Int64 = 0
//    
//    let dd = Double(d)
//    let kd = Double(k)
//    
//    for a in stride(from: d, through: 0, by: -1) {
//        print("a 순서: \(a)")
//        let ad = Double(a)
//        for b in stride(from: d, through: 0, by: -1) {
//            print("b 순서: \(b) ::: \(a), \(b)")
//            let bd = Double(b)
//            if (ad*ad*kd*kd + bd*bd*kd*kd) <= dd*dd {
//                total += Int64(b+1)
//                break
//            }
//        }
//    }
//    
//    return total
//}

//func solution(_ k:Int, _ d:Int) -> Int64 {
//    var total: Int64 = 0
//    
//    let dd = Double(d)
//    let kd = Double(k)
//    
//    for a in 0...d {
//        print("a 순서: \(d-a)")
//        let ad = Double(d-a)
//        for b in 0...d {
//            print("b 순서: \(d-b) ::: \(d-a), \(d-b)")
//            let bd = Double(d-b)
//            if (ad*ad*kd*kd + bd*bd*kd*kd) <= dd*dd {
//                total += Int64(d-b+1)
//                break
//            }
//        }
//    }
//    
//    return total
//}
