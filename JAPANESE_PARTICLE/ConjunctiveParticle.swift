//
//  ConjunctiveParticle.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 接續助詞的數據模型
struct ConjunctiveParticle: Identifiable {
    let id = UUID()
    let name: String
    let description: String // 助詞的特殊說明 (例如：だので -> なので)
    let functions: [String]
    let examples: [ExampleSet] // 使用 ExampleSet 來分組複雜的例句
}

// 用於儲存多組例句，特別是當功能有多條分組時
struct ExampleSet: Identifiable {
    let id = UUID()
    let sentences: [String]
}

// 實際的「接續助詞」數據
let conjunctiveParticlesData: [ConjunctiveParticle] = [
    ConjunctiveParticle(
        name: "から (kara)",
        description: "表示原因/理由。",
        functions: ["表示原因"],
        examples: [
            ExampleSet(sentences: ["疲れた**から**、早く寝る（累了所以會早點睡）", "雨が降っている**から**、出かけない（因為下雨所以不出門）", "病気だ**から**学校を休まなきゃ（生病了所以需要向學校請假）", "背が低い**から**自悲を感じている（長得矮所以感到自卑）"])
        ]
    ),
    ConjunctiveParticle(
        name: "ので (node)",
        description: "表示理由。前面是名詞或な形容詞時，接 **なので**。",
        functions: ["表示理由"],
        examples: [
            ExampleSet(sentences: ["病気**なので**学校に行けない（生病了所以無法上學）", "眠りすぎた**ので**、遅くなってしまった（睡過頭所以遲到）", "背が高い**ので**、自信を持っている（長得高所以有自信）"])
        ]
    ),
    ConjunctiveParticle(
        name: "けど / が / のに",
        description: "表示對比、轉折。**のに**前面是名詞或な形容詞時，接 **なのに**。",
        functions: ["表示對比、轉折"],
        examples: [
            ExampleSet(sentences: ["安い**けど**、美味しい（便宜但好吃）", "彼は頭がいい**が**、運動が苦手だ（他很聰明，但運動不擅長）", "雨が降っている**のに**、出かける（明明在下雨，卻還是出門）", "この町は賑やか**なのに**、夜になると静かだ（這個城市白天很熱鬧，但到了晚上變得很安靜）"])
        ]
    ),
    ConjunctiveParticle(
        name: "と (to)",
        description: "連接兩個句子。",
        functions: ["引用（搭配「思う」「知る」等，前面放名詞子句，辭書型）", "一怎麼...就怎麼...（As soon as，前面永遠接辭書型現在式）", "搭配意量型（考慮/嘗試做什麼）"],
        examples: [
            ExampleSet(sentences: [
                "日本語は学びにくい**と**思わないでください。",
                "君が好きだ**と**叫びたい！",
                "世界の終わりが来た**と**思った時、目を覚ましてしまった。",
                "キリスト教徒はイエスが復活した**と**信じているのに..."
            ]),
            ExampleSet(sentences: [
                "家に着く**と**、すぐに酒を飲み始めた",
                "会社に到着する**と**、コンピューターの電源を入れろ！"
            ]),
            ExampleSet(sentences: [
                "私はドイツに移住しよう**と**思っている。",
                "彼は娘がいじめられるのを防ごう**と**していた。"
            ])
        ]
    )
]
