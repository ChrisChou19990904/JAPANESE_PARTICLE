//
//  QuizOption.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 問題の選択肢
struct QuizOption: Identifiable {
    let id: String // "A", "B", "C", "D"
    let text: String
}

// 練習問題
struct QuizQuestion: Identifiable {
    let id: Int // 問題番号 (0 から 29)
    let questionText: String // 問題文
    let options: [QuizOption]
    let correctAnswer: String // 正解のID ("A", "B", "C", "D")
    let fullQuestionHTML: String // 元のHTMLの全文 (複雑な問題文や注釈用)
}
