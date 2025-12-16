//
//  CaseParticle.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 助詞的數據模型
struct CaseParticle: Identifiable {
    let id = UUID()
    let name: String
    let functions: [String] // 使用陣列儲存多個功能
    let examples: [String]  // 使用陣列儲存多個例句
}

// 實際的「格助詞」數據
let caseParticlesData: [CaseParticle] = [
    CaseParticle(
        name: "は (wa)",
        functions: ["主題標示"],
        examples: ["私**は**学生です（我是學生）"]
    ),
    CaseParticle(
        name: "が (ga)",
        functions: ["主語", "強調", "所有物特徵"],
        examples: ["彼**が**来た（他來了）", "紅茶を飲むこと**が**好きだ（我喜歡喝紅茶）", "あいつは背**が**高い（那個人很高）"]
    ),
    CaseParticle(
        name: "を (o)",
        functions: ["直接受詞", "穿過某個物體 (移動路徑)"],
        examples: ["私はコーヒー**を**飲んでいる（我正在喝咖啡）", "鳥は空**を**飛んでいる（鳥正在飛越天空）"]
    ),
    CaseParticle(
        name: "に (ni)",
        functions: ["時間 (定點)", "目的地", "施捨對象", "受益對象", "所在地 (存在)", "改變的狀態", "被動語態中的主動者", "為了做某件事 (動詞ます形+に+行く/来る/帰る)"],
        examples: ["飛行機は日曜日の午前八時**に**離陸する", "私は学校**に**行く", "私は彼**に**本をあげた", "タバコを吸うことは体**に**良くない", "私は東京**に**住んでいる", "君**に**なりたい", "彼女**に**騙されちゃいけない！", "人間を守り**に**来た"]
    ),
    CaseParticle(
        name: "で (de)",
        functions: ["地點 (動作發生地)", "手段 (工具)", "原因"],
        examples: ["家**で**勉強した（在家讀書）", "バス**で**空港へ行った（搭公車去機場）", "病気**で**学校を休んだ（因病請假）"]
    ),
    CaseParticle(
        name: "へ (e)",
        functions: ["方向 (強調朝向)"],
        examples: ["日本**へ**行く（去日本）"]
    ),
    CaseParticle(
        name: "と (to)",
        functions: ["並列、一起", "狀聲詞搭配"],
        examples: ["クラスメート**と**話さないでください", "リンゴ**と**グアバを買った", "シュシュッ**と**参上！", "ガンがビュビュン**と**唸る"]
    ),
    CaseParticle(
        name: "から (kara)",
        functions: ["起點 (從)"],
        examples: ["東京**から**来た（從東京來）"]
    ),
    CaseParticle(
        name: "まで (made)",
        functions: ["終點 (到)"],
        examples: ["駅**まで**歩く（走路到車站）"]
    )
]
