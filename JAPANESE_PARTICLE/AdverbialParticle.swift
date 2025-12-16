//
//  AdverbialParticle.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import Foundation

// 副助詞的數據模型
struct AdverbialParticle: Identifiable {
    let id = UUID()
    let name: String
    let uses: [UseDescription] // 儲存多個用法（意思+範例）
}

// 用於儲存單一用法的描述和範例
struct UseDescription: Identifiable {
    let id = UUID()
    let meaning: String
    let usageNotes: [String] // 具體的用法/語法說明
    let examples: [String]
}

// 實際的「副助詞」數據
let adverbialParticlesData: [AdverbialParticle] = [
    AdverbialParticle(
        name: "より (yori)",
        uses: [
            UseDescription(meaning: "比較 (B 比 A 更～)", usageNotes: ["A より B + のほうが"], examples: ["東京**より**大阪**のほうが**暑い。", "東京は大阪**より**大きい。"]),
            UseDescription(meaning: "起點 (從～起)", usageNotes: ["名詞（時間・場所）＋より"], examples: ["明日**より**新しい制度が始まります。"]),
            UseDescription(meaning: "方法 (透過～／經由～)", usageNotes: ["名詞＋より"], examples: ["メール**より**ご連絡ください。"]),
            UseDescription(meaning: "選擇 (與其～不如～)", usageNotes: ["動詞原形／否定形＋より、～た形+ほうがいい／ましだ"], examples: ["泣く**より**笑った**ほうが**いい。", "行かない**より**行った**ほうが**ましだ。"])
        ]
    ),
    AdverbialParticle(
        name: "よりも (yorimo)",
        uses: [
            UseDescription(meaning: "比較 (語氣較強)", usageNotes: ["より＋も"], examples: ["去年**よりも**日本語が上手になりました。", "私**よりも**あなたのほうが大事です。"])
        ]
    ),
    AdverbialParticle(
        name: "だけ (dake)",
        uses: [
            UseDescription(meaning: "只有、僅僅 (限定)", usageNotes: ["名詞/動詞辭書型+だけ"], examples: ["君**だけ**を守りたい。", "前**だけ**見つめて！"]),
            UseDescription(meaning: "只要...就...", usageNotes: ["動詞辭書型＋だけで（は）"], examples: ["彼と話す**だけで**、元気が出る。", "君が笑う**だけで**、僕は幸せだ。"]),
            UseDescription(meaning: "不但...而且", usageNotes: ["動詞辭書型＋だけでなく / だけじゃなく(て)"], examples: ["勉強する**だけ**でなく、運動する。"])
        ]
    ),
    AdverbialParticle(
        name: "しか…ない",
        uses: [
            UseDescription(meaning: "除了…之外都不 (排他性)", usageNotes: ["常與否定搭配", "名詞＋でしかない", "動詞普通型＋しかない"], examples: ["水**しか**飲ま**ない**。", "100円**しか**持ってい**ない**。", "あいつは人間**でしかない**。", "歩く**しかない**。"])
        ]
    ),
    AdverbialParticle(
        name: "ばかり (bakari)",
        uses: [
            UseDescription(meaning: "總是、淨是 (負面)", usageNotes: ["名詞/動詞て形＋ばかり(いる)"], examples: ["ゲーム**ばかり**している。", "彼女は文句**ばかり**言っている。", "彼は遊んで**ばかり**いる。"]),
            UseDescription(meaning: "剛剛、才", usageNotes: ["動詞た形＋ばかりです"], examples: ["彼は帰った**ばかり**です。"]),
            UseDescription(meaning: "大約、左右 (近似值)", usageNotes: ["數量詞＋ばかり"], examples: ["三時間**ばかり**待った。"])
        ]
    ),
    AdverbialParticle(
        name: "まで (made)",
        uses: [
            UseDescription(meaning: "連…也、甚至 (強調程度)", usageNotes: ["名詞＋まで"], examples: ["子供**まで**が泣き出した。"])
        ]
    ),
    AdverbialParticle(
        name: "でも (demo)",
        uses: [
            UseDescription(meaning: "就連…也 / …之類的", usageNotes: ["名詞＋でも"], examples: ["君**でも**できるよ。"])
        ]
    ),
    AdverbialParticle(
        name: "さえ (sae)",
        uses: [
            UseDescription(meaning: "連… (強調意外/最低條件)", usageNotes: ["名詞/動詞ば形＋さえ＋動詞ば"], examples: ["水**さえ**飲めば大丈夫だ。"])
        ]
    ),
    AdverbialParticle(
        name: "こそ (koso)",
        uses: [
            UseDescription(meaning: "正是、才是 (強力強調主體或理由)", usageNotes: ["名詞＋こそ"], examples: ["君**こそ**僕の希望だ。"])
        ]
    ),
    AdverbialParticle(
        name: "くらい / ぐらい",
        uses: [
            UseDescription(meaning: "大約、至少、…之類", usageNotes: ["數量詞/名詞＋くらい/ぐらい"], examples: ["一度**くらい**行ってみたい。"])
        ]
    ),
    AdverbialParticle(
        name: "ほど (hodo)",
        uses: [
            UseDescription(meaning: "不如", usageNotes: ["A は B ほど [否定]"], examples: ["キャプテンアメリカはドラキュラ伯爵**ほど**速くない。"]),
            UseDescription(meaning: "越…越…", usageNotes: ["動詞假定型ば＋動詞辭書型＋ほど"], examples: ["勉強すればする**ほど**、頭が良くなる。"]),
            UseDescription(meaning: "到...的地步 / 以至於", usageNotes: ["動詞辭書型＋ほど"], examples: ["驚く**ほど**美しい景色。", "歩けない**ほど**疲れた。", "忘れられない**ほど**好きだった。"])
        ]
    ),
    AdverbialParticle(
        name: "ながら（も）",
        uses: [
            UseDescription(meaning: "雖然…但是 (逆接)", usageNotes: ["名詞/動詞ます形去ます/動詞て形+ながら(も)"], examples: ["学生**ながら**社長をしている。"])
        ]
    )
]
