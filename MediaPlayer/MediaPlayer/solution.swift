//
//  MediaPlayer.swift
//  CodingTest
//
//  Created by cha on 9/27/24.
//

/// https://school.programmers.co.kr/learn/courses/30/lessons/340213?language=swift

import Foundation

typealias Time = (min: Int, sec: Int)

/// 10초 전으로 이동, 10초 후로 이동, 오프닝 건너뛰기 3가지 기능을 지원
/// - Parameters:
///   - video_len: 동영상의 길이 "mm:ss"
///   - pos: 기능이 수행되기 직전의 재생위치 "mm:ss"
///   - op_start: 오프닝 시작 시각 "mm:ss"
///   - op_end: 오프닝이 끝나는 시각  "mm:ss"
///   - commands: 사용자의 입력을 나타내는 1차원 문자열 배열  "next", "prev"
/// - Returns: 사용자의 입력이 모두 끝난 후 동영상의 위치  "mm:ss"
/// - Note:
/// prev 10초 전으로 이동: 사용자가 "prev" 명령을 입력할 경우 동영상의 재생 위치를 현재 위치에서 10초 전으로 이동합니다. 현재 위치가 10초 미만인 경우 영상의 처음 위치로 이동합니다. 영상의 처음 위치는 0분 0초입니다.
/// next 10초 후로 이동: 사용자가 "next" 명령을 입력할 경우 동영상의 재생 위치를 현재 위치에서 10초 후로 이동합니다. 동영상의 남은 시간이 10초 미만일 경우 영상의 마지막 위치로 이동합니다. 영상의 마지막 위치는 동영상의 길이와 같습니다.
/// 오프닝 건너뛰기: 현재 재생 위치가 오프닝 구간(op_start ≤ 현재 재생 위치 ≤ op_end)인 경우 자동으로 오프닝이 끝나는 위치로 이동합니다.
func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    var resultTime = pos.toTime
    
    let posTime = pos.toTime
    let opStartTime = op_start.toTime
    let opEndTime = op_end.toTime
    let videoLenTime = video_len.toTime
    
    resultTime = skip(posTime, start: opStartTime, end: opEndTime)
    
    for command in commands {
//        print("command = \(command), target = \(resultTime)")
        if command == "next" {
            resultTime = next(resultTime, videoLen: videoLenTime, opStart: opStartTime, opEnd: opEndTime)
        }
        
        if command == "prev" {
            resultTime = prev(resultTime, videoLen: videoLenTime, opStart: opStartTime, opEnd: opEndTime)
        }
//        print("command = \(command), result = \(resultTime)")
    }
    
    return String(format: "%02d:%02d", resultTime.min, resultTime.sec)
}

extension String {
    var toTime: Time {
        let arr = self.split(separator: ":")
        let min = Int(arr[0]) ?? 0
        let sec = Int(arr[1]) ?? 0
        return (min, sec)
    }
}

/// 일치할 경우 true
func isBefore(_ target: Time, comparedTo comparison: Time) -> Bool {
    if target.min < comparison.min {
        return true
    }
    
    if target.min == comparison.min {
        return target.sec <= comparison.sec
    }
    
    return false
}

/// 일치할 경우 true
func isAfter(_ target: Time, comparedTo comparison:Time) -> Bool {
    if target.min > comparison.min {
        return true
    }
    
    if target.min == comparison.min {
        return target.sec >= comparison.sec
    }
    
    return false
}

/// 일치할 경우 true
func isBetween(_ target: Time, start: Time, end: Time) -> Bool {
    let result = isAfter(target, comparedTo: start) && isBefore(target, comparedTo: end)
//    print("사이값인지? target: \(target), start: \(start), end: \(end), result = \(result)")
    return result
}

func skip(_ target: Time, start: Time, end: Time) -> Time {
    return isBetween(target, start: start, end: end) ? end : target
}

func next(_ target: Time, videoLen: Time, opStart: Time, opEnd: Time) -> Time {
    var result = target
    if target.sec + 10 < 60 {
        result = (target.min, target.sec + 10)
    } else {
        result = (target.min + 1, target.sec - 50) // +10초 -60초
    }
    
    if isAfter(result, comparedTo: videoLen) {
        result = videoLen
    }
    
    result = skip(result, start: opStart, end: opEnd)
    
    return result
}

func prev(_ target: Time, videoLen: Time, opStart: Time, opEnd: Time) -> Time {
    var result = target
    if target.sec - 10 >= 0 {
        result = (target.min, target.sec - 10)
    } else {
        result = (target.min - 1, target.sec + 50) // -10초 +60초
    }
    
    if isBefore(result, comparedTo: (0,0)) {
        result = (0,0)
    }
    
    result = skip(result, start: opStart, end: opEnd)
    
    return result
}
