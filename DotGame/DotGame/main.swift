//
//  main.swift
//  DotGame
//
//  Created by cha on 10/7/24.
//

import Foundation

print("soulution start!")
let startTime = DispatchTime.now()

print(solution(2, 4)) // 6
print("정답!!")
print(solution(1, 5)) // 26
print("정답!!")

let endTime = DispatchTime.now()

let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds  // 나노초 단위 차이 계산
let executionTime = Double(nanoTime) / 1_000_000_000  // 초 단위로 변환
print("총 실행시간: \(executionTime) seconds")

