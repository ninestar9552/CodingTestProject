//
//  soulution.swift
//  SecretCode
//
//  Created by cha on 3/4/25.
//

/**
 https://school.programmers.co.kr/learn/courses/30/lessons/388352
 당신은 비밀 조직의 보안 시스템을 뚫고 중요한 정보를 해독해야 합니다. 시스템은 1부터 n까지의 서로 다른 정수 5개가 오름차순으로 정렬된 비밀 코드를 가지고 있으며, 당신은 이 비밀 코드를 맞혀야 합니다.

 당신은 비밀 코드를 알아내기 위해 암호 분석 도구를 사용하며, m번의 시도를 할 수 있습니다. 각 시도마다 서로 다른 5개의 정수를 입력하면, 시스템은 그 중 몇 개가 비밀 코드에 포함되어 있는지 알려줍니다.

 만약 비밀 코드가 [3, 5, 7, 9, 10]이고, 입력한 정수가 [1, 2, 3, 4, 5]라면 비밀 코드에 포함된 정수는 3, 5 두 개이므로 시스템은 2를 응답합니다.
 당신은 m번의 시도 후, 비밀 코드로 가능한 정수 조합의 개수를 알고 싶습니다.

 비밀 코드에 사용된 정수의 범위가 1~10일 때, 아래와 같이 5번의 시도를 했다고 가정해 보겠습니다.

 입력한 정수    시스템 응답(일치하는 개수)
 [1, 2, 3, 4, 5]    2개
 [6, 7, 8, 9, 10]    3개
 [3, 7, 8, 9, 10]    4개
 [2, 5, 7, 9, 10]    3개
 [3, 4, 5, 6, 7]    3개
 비밀 코드로 가능한 정수 조합은 아래와 같이 3개가 있습니다.

 [3, 4, 7, 9, 10]
 첫 번째 시도에서 비밀 코드에 포함된 정수가 3, 4로 2개 있습니다.
 두 번째 시도에서 비밀 코드에 포함된 정수가 7, 9, 10으로 3개 있습니다.
 세 번째 시도에서 비밀 코드에 포함된 정수가 3, 7, 9, 10으로 4개 있습니다.
 네 번째 시도에서 비밀 코드에 포함된 정수가 7, 9, 10으로 3개 있습니다.
 다섯 번째 시도에서 비밀 코드에 포함된 정수가 3, 4, 7로 3개 있습니다.
 [3, 5, 7, 8, 9]
 첫 번째 시도에서 비밀 코드에 포함된 정수가 3, 5로 2개 있습니다.
 두 번째 시도에서 비밀 코드에 포함된 정수가 7, 8, 9로 3개 있습니다.
 세 번째 시도에서 비밀 코드에 포함된 정수가 3, 7, 8, 9로 4개 있습니다.
 네 번째 시도에서 비밀 코드에 포함된 정수가 5, 7, 9로 3개 있습니다.
 다섯 번째 시도에서 비밀 코드에 포함된 정수가 3, 5, 7로 3개 있습니다.
 [3, 5, 7, 8, 10]
 첫 번째 시도에서 비밀 코드에 포함된 정수가 3, 5로 2개 있습니다.
 두 번째 시도에서 비밀 코드에 포함된 정수가 7, 8, 10으로 3개 있습니다.
 세 번째 시도에서 비밀 코드에 포함된 정수가 3, 7, 8, 10으로 4개 있습니다.
 네 번째 시도에서 비밀 코드에 포함된 정수가 5, 7, 10으로 3개 있습니다.
 다섯 번째 시도에서 비밀 코드에 포함된 정수가 3, 5, 7로 3개 있습니다.
 정수 n, 입력한 정수를 담은 2차원 정수 배열 q와 시스템 응답을 담은 1차원 정수 배열 ans가 매개변수로 주어집니다. 이때, 비밀 코드로 가능한 정수 조합 개수를 return 하도록 solution 함수를 완성해 주세요.

 제한사항
 10 ≤ n ≤ 30
 1 ≤ (q의 길이 = m) ≤ 10
 q[i]의 길이 = 5
 q[i]는 i+1번째 시도에서 입력한 5개의 서로 다른 정수를 담고 있으며, 오름차순으로 정렬되어 있습니다.
 1 ≤ q[i][j] ≤ n
 ans의 길이 = m
 ans[i]는 i+1번째 시도에서 입력한 5개의 정수 중 비밀 코드에 포함된 정수의 개수를 나타냅니다.
 0 ≤ ans[i] ≤ 5
 비밀 코드가 존재하지 않는(답이 0인) 경우는 주어지지 않습니다.
 */

import Foundation

func solution(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    print("START-------------------------------------------")
    print("n: \(n)\nq: \(q)\nans: \(ans)")
    
    // 1부터 n까지 5개 정수 배열의 모든 경우의 수
    var allNumberList: [[Int]] = []
    for i1 in 1...n-4 {
        for i2 in i1+1...n-3 {
            for i3 in i2+1...n-2 {
                for i4 in i3+1...n-1 {
                    for i5 in i4+1...n {
                        allNumberList.append([i1, i2, i3, i4, i5])
                    }
                }
            }
        }
    }
    print("모든 배열의 수 \(allNumberList.count)")
    
    // 모든 경우의 수에 대해서 q&ans를 만족하는지 체크
    var resultList: [[Int]] = []
    for numberList in allNumberList {
        var ansCheck = true
        for (index, qList) in q.enumerated() {
            if Set(numberList).intersection(qList).count != ans[index] {
                ansCheck = false
            }
        }
        if ansCheck {
            print("일치! \(numberList)")
            resultList.append(numberList)
        }
    }
    
    let result = resultList.count
    print("result = \(result)")
    print("END---------------------------------------------")
    return result
}


// GPT가 수정해준 코드
func solution2(_ n:Int, _ q:[[Int]], _ ans:[Int]) -> Int {
    print("START-------------------------------------------")
    print("n: \(n)\nq: \(q)\nans: \(ans)")
    
    var count = 0
    
    for i1 in 1...n-4 {
        for i2 in i1+1...n-3 {
            for i3 in i2+1...n-2 {
                for i4 in i3+1...n-1 {
                    for i5 in i4+1...n {
                        let numberList = [i1, i2, i3, i4, i5]
                        
                        var isValid = true
                        for (index, qList) in q.enumerated() {
                            if numberList.filter(qList.contains).count != ans[index] {
                                isValid = false
                                break
                            }
                        }
                        
                        if isValid {
                            count += 1
                        }
                    }
                }
            }
        }
    }
    
    let result = count
    print("result = \(result)")
    print("END---------------------------------------------")
    return result
}
