//
//  DakeUsage.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 「だけ」用法核心結構
struct DakeUsage: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let structure: String
    let examples: [ExampleSentence]
}

// 例句結構
struct ExampleSentence: Identifiable {
    let id = UUID()
    let japanese: String
    let chinese: String
    let context: String? // 語氣或背景說明 (如出自歌曲)
}

// 實際的「だけ」用法數據
let dakeUsageData: [DakeUsage] = [
    DakeUsage(
        title: "「だけ」 (Dake)",
        description: "表示「僅僅、只有」。功能為限制主語、對象或動作的範圍。",
        structure: "名詞 / 動詞(辭書型) + だけ",
        examples: [
            ExampleSentence(japanese: "君**だけ**を見ている", chinese: "我的眼中只有你", context: "情感專一、唯一性"),
            ExampleSentence(japanese: "誰よりも、何よりも、君**だけ**を守りたい。", chinese: "比起任何人、任何事，我只想守護你。", context: "出自《君だけを守りたい》")
        ]
    ),
    DakeUsage(
        title: "「だけでは」/「だけじゃ」",
        description: "表示「如果只有～的話，是不夠的、不行的」。表達對現狀的不滿或渴望改變。",
        structure: "動詞(辭書型) + だけでは / だけじゃ (口語)",
        examples: [
            ExampleSentence(japanese: "待ってる**だけじゃ**、ダメな気がした", chinese: "我覺得光是等待是不行的", context: "出自《Life Goes On》：透露主動改變的情感掙扎"),
            ExampleSentence(japanese: "力で勝つ**だけじゃ**、なにかが足りない", chinese: "僅靠力量取勝會缺少甚麼", context: "出自《Spirit》：蘊含對多元價值的追求"),
            ExampleSentence(japanese: "足踏みしてる**だけじゃ**、進まない", chinese: "僅僅原地踏步是無法前進的", context: "出自《Eiyuu》：傳達試圖自我突破的精神")
        ]
    )
]
