//
//  solution.swift
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
//func solution(_ k:Int, _ d:Int) -> Int64 {
//    print("문제시작! k = \(k), d = \(d)")
//    var total: Int64 = 0
//    
//    let dSrq = Double(d*d)
//    
//    for a in 0...d {
//        print("a ======== \(a)")
//        let akd = Double(a*k)
//        
//        var max = d+1
//        var min = -1
//        
//        var answer = min
//        while min < max, max != 0 {
//            let mid = (max+min)/2
//            print("b ======== \(mid)")
//            let bkd = Double(mid*k)
//            print("mid = \(mid), 좌표(\(akd),\(bkd)), 최소 = \(min), 최대 = \(max)")
//            let left = akd*akd + bkd*bkd
//            let right = dSrq
//            print("비교\n\(left)\n\(right)")
//            if left > right {
//                print("오버")
//                max = mid
//            } else {
//                print("만족")
//                answer = mid
//                min = mid + 1
//            }
//            print("중간결과 최소 = \(min), 최대 = \(max), 답 = \(answer)")
//        }
//        
//        total += Int64(answer+1)
//        print("결과: a = \(a), b = \(answer), total = \(total)")
//    }
//    
//    return total
//}

// maxY 값을 이진탐색을 활용하여 풀이
func solution(_ k:Int, _ d:Int) -> Int64 {
    print("문제시작! k = \(k), d = \(d)")
    var total: Int64 = 0
    
    let dSrq = Double(d*d)
    
    for a in 0...d {
        let akd = Double(a*k)
        
        // 조건에 만족하는 최대값을 찾아야 함!!!!!!!!!!!!!!!!!1
        // 최대값 = 최대거리 d
        var max = d
        // 최소값 = 0
        var min = -1
        
        // 정답은 일단 최소값으로 찍어놓고 시작
        var answer = min
        
        // 최소값이 최대값보다 작으면 계속 반복
        while min < max, max != 0 {
            
            // 중간값 계산
            let mid = (max+min)/2
            
            // left = 대각선 길이 제곱, right = d(최대거리) 제곱
            let bkd = Double(mid*k)
            let left = akd*akd + bkd*bkd
            let right = dSrq
            
            if left > right {
                // left가 더 크면 조건에 불합격 (대각선 길이가 d보다 같거나 작아야됨)
                max = mid
            } else {
                // right가 더 크면 조건에 만족
                answer = mid
                min = mid + 1
            }
        }
        
        // 최종적으로 조건을 만족하는 가장 큰 값 answer를 찾아야 됨
        
        total += Int64(answer+1)
    }
    
    return total
}

