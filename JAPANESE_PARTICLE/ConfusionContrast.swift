//
//  ConfusionContrast.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 混淆對比數據模型
struct ConfusionContrast: Identifiable {
    let id = UUID()
    let title: String
    let comparison: [String] // 比較規則
    let examples: [ExamplePair]
}

// 範例組
struct ExamplePair: Identifiable {
    let id = UUID()
    let japanese: String
    let meaning: String
}

// 實際的「常見混淆對比」數據
let confusionContrastsData: [ConfusionContrast] = [
    ConfusionContrast(
        title: "「は」 vs 「が」",
        comparison: ["「は」強調話題（Theme Marker），側重於描述主題。", "「が」強調主語或新資訊（Subject Marker），側重於提問或強調主語。"],
        examples: [
            ExamplePair(japanese: "私は日本人です。", meaning: "（我是日本人：強調「我」這個主題）"),
            ExamplePair(japanese: "彼が先生です。", meaning: "（他是老師：強調「老師」或回答「誰是老師？」）")
        ]
    ),
    ConfusionContrast(
        title: "「に」 vs 「で」",
        comparison: ["「に」表示動作的目的地、存在地或時間點。", "「で」表示動作的發生地（Location of Action）、手段或原因。"],
        examples: [
            ExamplePair(japanese: "学校に行きます。", meaning: "（去學校：強調目的地/方向）"),
            ExamplePair(japanese: "学校で勉強します。", meaning: "（在學校讀書：強調動作發生地）")
        ]
    )
]
