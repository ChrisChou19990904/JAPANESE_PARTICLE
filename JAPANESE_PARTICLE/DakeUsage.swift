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
    let url: String? // 這裡存放 YouTube 連結
}

// 實際的「だけ」用法數據
let dakeUsageData: [DakeUsage] = [
    DakeUsage(
        title: "「だけ則為」/「だけじゃ」",
        description: "表示「如果只有～的話，是不夠的、不行的」。表達對現狀的不滿或渴望改變。",
        structure: "動詞(辭書型) + だけでは / だけじゃ (口語)",
        examples: [
            ExampleSentence(
                japanese: "待ってる**だけじゃ**、ダメな気がした",
                chinese: "我覺得光是等待是不行的",
                context: "出自《Life Goes On》",
                url: "https://www.youtube.com/shorts/WNHKOcy_8o4?feature=share"
            ),
            ExampleSentence(
                japanese: "力で勝つ**だけじゃ**、なにかが足りない",
                chinese: "僅靠力量取勝會缺少甚麼",
                context: "出自《Spirit》",
                url: "https://youtu.be/nipun3790KY?si=sWqaHMdvuqV43s5B"
            ),
            ExampleSentence(
                japanese: "足踏みしてる**だけじゃ**、進まない",
                chinese: "僅僅原地踏步是無法前進的",
                context: "出自《Eiyuu》",
                url: "https://youtu.be/9K2U8e9-eA0?si=957QH5WC_RhlmGTG"
            )
        ]
    )
]
