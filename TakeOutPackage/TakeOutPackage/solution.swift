//
//  solution.swift
//  TakeOutPackage
//
//  Created by cha on 3/4/25.
//

import Foundation

/**
 https://school.programmers.co.kr/learn/courses/30/lessons/389478
 1 ~ n의 번호가 있는 택배 상자가 창고에 있습니다. 당신은 택배 상자들을 다음과 같이 정리했습니다.

 왼쪽에서 오른쪽으로 가면서 1번 상자부터 번호 순서대로 택배 상자를 한 개씩 놓습니다. 가로로 택배 상자를 w개 놓았다면 이번에는 오른쪽에서 왼쪽으로 가면서 그 위층에 택배 상자를 한 개씩 놓습니다. 그 층에 상자를 w개 놓아 가장 왼쪽으로 돌아왔다면 또다시 왼쪽에서 오른쪽으로 가면서 그 위층에 상자를 놓습니다. 이러한 방식으로 n개의 택배 상자를 모두 놓을 때까지 한 층에 w개씩 상자를 쌓습니다.
 
 https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/e06b4c0d-0ce6-4a2d-8ad4-ba20f9398145/ex1-1.png
 위 그림은 w = 6일 때 택배 상자 22개를 쌓은 예시입니다.
 다음 날 손님은 자신의 택배를 찾으러 창고에 왔습니다. 당신은 손님이 자신의 택배 상자 번호를 말하면 해당 택배 상자를 꺼내줍니다. 택배 상자 A를 꺼내려면 먼저 A 위에 있는 다른 모든 상자를 꺼내야 A를 꺼낼 수 있습니다. 예를 들어, 위 그림에서 8번 상자를 꺼내려면 먼저 20번, 17번 상자를 꺼내야 합니다.

 당신은 꺼내려는 상자 번호가 주어졌을 때, 꺼내려는 상자를 포함해 총 몇 개의 택배 상자를 꺼내야 하는지 알고 싶습니다.

 창고에 있는 택배 상자의 개수를 나타내는 정수 n, 가로로 놓는 상자의 개수를 나타내는 정수 w와 꺼내려는 택배 상자의 번호를 나타내는 정수 num이 매개변수로 주어집니다. 이때, 꺼내야 하는 상자의 총개수를 return 하도록 solution 함수를 완성해 주세요.
 
 제한사항
 2 ≤ n ≤ 100
 1 ≤ w ≤ 10
 1 ≤ num ≤ n
 */
func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    print("-------------------------------------------")
    print("n: \(n), w: \(w), num: \(num)")
    // 올림 처리로 row 구하기
    let maxRow = Int((Double(n)/Double(w)).rounded(.up))
    let numRow = Int((Double(num)/Double(w)).rounded(.up))
    print("maxRow: \(maxRow)")
    print("numRow: \(numRow)")
    
    // 열(column) 계산
    var nColumn = (n%w == 0) ? w : n%w
    if maxRow%2 == 0 {
        nColumn = w - nColumn + 1
    }
    
    var numColumn = (num%w == 0) ? w : num%w
    if numRow%2 == 0 {
        numColumn = w - numColumn + 1
    }
    print("nColumn: \(nColumn)")
    print("numColumn: \(numColumn)")
    
    if maxRow%2 == 0 {
        // 만약 맨 윗줄이 짝수row라면 맨 윗줄은 오른쪽에서 왼쪽으로 채워짐
        return (numColumn >= nColumn) ? (maxRow - numRow + 1) : (maxRow - numRow)
    } else {
        // 만약 맨 윗줄이 홀수row라면 맨 윗줄은 왼쪽에서 오른쪽으로 채워짐
        return (numColumn <= nColumn) ? (maxRow - numRow + 1) : (maxRow - numRow)
    }
}

// GPT가 수정해준 답안코드
func solution2(_ n:Int, _ w:Int, _ num:Int) -> Int {
    print("-------------------------------------------")
    print("n: \(n), w: \(w), num: \(num)")
    // 올림 없이 행(row) 구하기
    let maxRow = (n + w - 1) / w
    let numRow = (num + w - 1) / w
    print("maxRow: \(maxRow)")
    print("numRow: \(numRow)")
    
    // 열(column) 계산
    let nColumn = (maxRow % 2 == 1) ? (n - 1) % w + 1 : w - (n - 1) % w
    let numColumn = (numRow % 2 == 1) ? (num - 1) % w + 1 : w - (num - 1) % w
    print("nColumn: \(nColumn)")
    print("numColumn: \(numColumn)")
    
    return (maxRow % 2 == 1) ? (numColumn <= nColumn ? maxRow - numRow + 1 : maxRow - numRow)
                                 : (numColumn >= nColumn ? maxRow - numRow + 1 : maxRow - numRow)
}
