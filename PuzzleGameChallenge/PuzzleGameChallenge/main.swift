//
//  main.swift
//  PuzzleGameChallenge
//
//  Created by cha on 10/4/24.
//

import Foundation

print("soulution start!")
let startTime = DispatchTime.now()

// solution 실행
print(solution([1, 5, 3], [2, 4, 7], 30)) // 3
print("정답1")
print(solution([1, 4, 4, 2], [6, 3, 8, 2], 59)) // 2
print("정답2")
print(solution([1, 328, 467, 209, 54], [2, 7, 1, 4, 3], 1723)) // 294
print("정답3")
print(solution([1, 99999, 100000, 99995], [9999, 9001, 9999, 9001], 3456789012)) // 39354
print("정답4")

let endTime = DispatchTime.now()

let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds  // 나노초 단위 차이 계산
let executionTime = Double(nanoTime) / 1_000_000_000  // 초 단위로 변환
print("총 실행시간: \(executionTime) seconds")
