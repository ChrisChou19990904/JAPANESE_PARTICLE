//
//  QuizViewModel.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation
import Observation

// ViewModel：測驗のロジックと状態を管理
@Observable
class QuizViewModel {
    let questions: [QuizQuestion] = quizData
    var selectedAnswers: [Int: String] = [:] // [問題ID: 選択されたオプションID]
    var isQuizSubmitted: Bool = false
    
    // スコアを計算する算出プロパティ
    var score: Int {
        var correctCount = 0
        for question in questions {
            if selectedAnswers[question.id] == question.correctAnswer {
                correctCount += 1
            }
        }
        return correctCount
    }
    
    // ユーザーの選択を記録する
    func selectOption(questionId: Int, optionId: String) {
        selectedAnswers[questionId] = optionId
    }
    
    // 採点と結果表示を行う
    func submitQuiz() {
        isQuizSubmitted = true
    }
    
    // オプションが正解かどうかを判定
    func isOptionCorrect(questionId: Int, optionId: String) -> Bool {
        guard isQuizSubmitted else { return false }
        return questions.first(where: { $0.id == questionId })?.correctAnswer == optionId
    }
    
    // オプションがユーザーの選択であり、かつ不正解かどうかを判定
    func isOptionIncorrectlySelected(questionId: Int, optionId: String) -> Bool {
        guard isQuizSubmitted else { return false }
        let selected = selectedAnswers[questionId]
        let correct = questions.first(where: { $0.id == questionId })?.correctAnswer
        return selected == optionId && selected != correct
    }
}
