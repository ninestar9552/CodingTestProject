//
//  MediaPlayerGPT.swift
//  CodingTest
//
//  Created by cha on 9/27/24.
//

/// https://school.programmers.co.kr/learn/courses/30/lessons/340213?language=swift

import Foundation

/// 10초 전으로 이동, 10초 후로 이동, 오프닝 건너뛰기 3가지 기능을 지원
/// - Parameters:
///   - video_len: 동영상의 길이 "mm:ss"
///   - pos: 기능이 수행되기 직전의 재생위치 "mm:ss"
///   - op_start: 오프닝 시작 시각 "mm:ss"
///   - op_end: 오프닝이 끝나는 시각  "mm:ss"
///   - commands: 사용자의 입력을 나타내는 1차원 문자열 배열  "next", "prev"
/// - Returns: 사용자의 입력이 모두 끝난 후 동영상의 위치  "mm:ss"
func solution2(_ video_len: String, _ pos: String, _ op_start: String, _ op_end: String, _ commands: [String]) -> String {
    var resultTime = pos.toSeconds
    let opStartTime = op_start.toSeconds
    let opEndTime = op_end.toSeconds
    let videoLenTime = video_len.toSeconds
    
    resultTime = skip(resultTime, start: opStartTime, end: opEndTime)
    
    for command in commands {
        if command == "next" {
            resultTime = next(resultTime, videoLen: videoLenTime, opStart: opStartTime, opEnd: opEndTime)
        } else if command == "prev" {
            resultTime = prev(resultTime, videoLen: videoLenTime, opStart: opStartTime, opEnd: opEndTime)
        }
    }
    
    return resultTime.toFormattedString
}

extension String {
    /// "mm:ss" 형식의 문자열을 초로 변환
    var toSeconds: Int {
        let components = self.split(separator: ":").map { Int($0) ?? 0 }
        return components[0] * 60 + components[1]
    }
}

extension Int {
    /// 초 단위를 "mm:ss" 형식의 문자열로 변환
    var toFormattedString: String {
        return String(format: "%02d:%02d", self / 60, self % 60)
    }
}

/// 현재 시간이 오프닝 구간에 있으면 끝 시점으로 이동
func skip(_ target: Int, start: Int, end: Int) -> Int {
    return (target >= start && target <= end) ? end : target
}

func next(_ target: Int, videoLen: Int, opStart: Int, opEnd: Int) -> Int {
    var result = min(target + 10, videoLen)
    result = skip(result, start: opStart, end: opEnd)
    return result
}

func prev(_ target: Int, videoLen: Int, opStart: Int, opEnd: Int) -> Int {
    var result = max(target - 10, 0)
    result = skip(result, start: opStart, end: opEnd)
    return result
}
