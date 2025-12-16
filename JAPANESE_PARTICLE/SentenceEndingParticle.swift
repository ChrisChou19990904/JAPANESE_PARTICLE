//
//  SentenceEndingParticle.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 終助詞的數據模型
struct SentenceEndingParticle: Identifiable {
    let id = UUID()
    let name: String
    let function: String
    let example: String
    let meaning: String // 新增欄位，用於儲存中文意思
}

// 實際的「終助詞」數據
let sentenceEndingParticlesData: [SentenceEndingParticle] = [
    SentenceEndingParticle(
        name: "ね (ne)",
        function: "確認、共鳴 (尋求對方同意)",
        example: "いい天気です**ね**！",
        meaning: "（多麼好的天氣啊！）"
    ),
    SentenceEndingParticle(
        name: "よ (yo)",
        function: "強調、告知 (提供新資訊或強烈主張)",
        example: "本当に美味しい**よ**！",
        meaning: "（真的非常美味！）"
    ),
    SentenceEndingParticle(
        name: "か (ka)",
        function: "疑問句 (提出問題)",
        example: "あなたは果物を食べることが好きです**か**？",
        meaning: "（你喜歡吃水果嗎？）"
    )
]
