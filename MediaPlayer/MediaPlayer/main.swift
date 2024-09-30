//
//  main.swift
//  MediaPlayer
//
//  Created by cha on 9/27/24.
//

import Foundation

///시간을 튜플 (min, sec) 형태로 변환하는 방식과, 시간을 Int 초로 변환하는 방식으로 구현
///코드는 시간을 Int 초로 변환하는 방식이 훨씬 간결하였으나,
///작동속도는 튜플로 변환하는 방식이 미세하게 빠름

print("soulution start!")
let startTime = DispatchTime.now()

for i in 1...600000 {
    // 예시
    solution("34:33", "13:00", "00:55", "02:55", ["next", "prev"]) // "13:00"
    solution("10:55", "00:05", "00:15", "06:55", ["prev", "next", "next"]) // "06:55"
    solution("07:22", "04:05", "00:15", "04:07", ["next"]) // "04:17"
    // 반례
    solution("30:35", "30:30", "01:00", "02:00", ["next"]) // "30:35"
    solution("30:00", "15:00", "15:10", "15:30", ["next", "next"]) // "15:40"
    solution("30:00", "01:05", "01:00", "01:30", ["prev"]) // "01:30"
    solution("30:00", "29:55", "01:00", "01:30", ["next"]) // "30:00"
    solution("30:00", "01:55", "01:00", "01:30", ["next"]) // "02:05"
    solution("30:00", "00:11", "05:00", "06:00", ["prev"]) // "00:01"
    solution("59:59", "59:45", "00:00", "01:00", ["next"]) // "59:55"
    solution("30:00", "00:08", "00:00", "00:05", ["prev"]) // "00:05"
}

let endTime = DispatchTime.now()

let nanoTime = endTime.uptimeNanoseconds - startTime.uptimeNanoseconds  // 나노초 단위 차이 계산
let executionTime = Double(nanoTime) / 1_000_000_000  // 초 단위로 변환
print("총 실행시간: \(executionTime) seconds")


//=============================================================================================
print("soulution2 start!")
let startTime2 = DispatchTime.now()

for i in 1...600000 {
    // 예시
    solution2("34:33", "13:00", "00:55", "02:55", ["next", "prev"]) // "13:00"
    solution2("10:55", "00:05", "00:15", "06:55", ["prev", "next", "next"]) // "06:55"
    solution2("07:22", "04:05", "00:15", "04:07", ["next"]) // "04:17"
    // 반례
    solution2("30:35", "30:30", "01:00", "02:00", ["next"]) // "30:35"
    solution2("30:00", "15:00", "15:10", "15:30", ["next", "next"]) // "15:40"
    solution2("30:00", "01:05", "01:00", "01:30", ["prev"]) // "01:30"
    solution2("30:00", "29:55", "01:00", "01:30", ["next"]) // "30:00"
    solution2("30:00", "01:55", "01:00", "01:30", ["next"]) // "02:05"
    solution2("30:00", "00:11", "05:00", "06:00", ["prev"]) // "00:01"
    solution2("59:59", "59:45", "00:00", "01:00", ["next"]) // "59:55"
    solution2("30:00", "00:08", "00:00", "00:05", ["prev"]) // "00:05"
}

let endTime2 = DispatchTime.now()

let nanoTime2 = endTime2.uptimeNanoseconds - startTime2.uptimeNanoseconds  // 나노초 단위 차이 계산
let executionTime2 = Double(nanoTime2) / 1_000_000_000  // 초 단위로 변환
print("총 실행시간: \(executionTime2) seconds")
