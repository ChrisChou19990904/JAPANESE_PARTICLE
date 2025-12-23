//
//  AdverbialParticleView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

// --- 1. 數據模型區 ---
struct AdverbialParticle: Identifiable {
    let id = UUID()
    let name: String
    let uses: [UseDescription]
}

struct UseDescription: Identifiable {
    let id = UUID()
    let meaning: String
    let usageNotes: [String]
    let examples: [String]
}

// --- 2. 實際數據區 (確保定義在 struct 外面) ---
let adverbialParticlesData: [AdverbialParticle] = [
    AdverbialParticle(
        name: "より (yori)",
        uses: [
            UseDescription(meaning: "比較 (B 比 A 更～)", usageNotes: ["A より B + のほうが"], examples: ["東京より大阪のほうが暑い。", "東京は大阪より大きい。"]),
            UseDescription(meaning: "起點 (從～起)", usageNotes: ["名詞（時間・場所）＋より"], examples: ["明日より新しい制度が始まります。"]),
            UseDescription(meaning: "方法 (透過～／經由～)", usageNotes: ["名詞＋より"], examples: ["メールよりご連絡ください。"]),
            UseDescription(meaning: "選擇 (與其～不如～)", usageNotes: ["動詞原形／否定形＋より、～た形+ほうがいい／ましだ"], examples: ["泣くより笑ったほうがいい。", "行かないより行ったほうがましだ。"])
        ]
    ),
    AdverbialParticle(
        name: "よりも (yorimo)",
        uses: [
            UseDescription(meaning: "比較 (語氣較強)", usageNotes: ["より＋も"], examples: ["去年よりも日本語が上手になりました。", "私よりもあなたのほうが大事です。"])
        ]
    ),
    AdverbialParticle(
        name: "だけ (dake)",
        uses: [
            UseDescription(meaning: "只有、僅僅 (限定)", usageNotes: ["名詞/動詞辭書型+だけ"], examples: ["君だけを守りたい。", "前だけ見つめて！"]),
            UseDescription(meaning: "只要...就...", usageNotes: ["動詞辭書型＋だけで（は）"], examples: ["彼と話すだけで、開心が出る。", "君が笑うだけで、僕は幸せだ。"]),
            UseDescription(meaning: "不但...而且", usageNotes: ["動詞辭書型＋だけでなく / だけじゃなく(提)"], examples: ["勉強するだけでなく、運動する。"])
        ]
    ),
    AdverbialParticle(
        name: "しか…ない",
        uses: [
            UseDescription(meaning: "除了…之外都不", usageNotes: ["常與否定搭配", "名詞＋でしかない"], examples: ["水しか飲まない。", "100円しか持っていない。", "あいつは人間でしかない。"])
        ]
    ),
    AdverbialParticle(
        name: "ばかり (bakari)",
        uses: [
            UseDescription(meaning: "總是、淨是", usageNotes: ["名詞/動詞て形＋ばかり(いる)"], examples: ["遊戲ばかりしている。", "她ばかり文句を言っている。"]),
            UseDescription(meaning: "剛剛、才", usageNotes: ["動詞た形＋ばかりです"], examples: ["彼は歸ったばかりです。"]),
            UseDescription(meaning: "大約、左右", usageNotes: ["數量詞＋ばかり"], examples: ["三時間ばかり待った。"])
        ]
    ),
    AdverbialParticle(
        name: "まで (made)",
        uses: [UseDescription(meaning: "連…也、甚至", usageNotes: ["名詞＋まで"], examples: ["子供までが泣き出した。"])]
    ),
    AdverbialParticle(
        name: "でも (demo)",
        uses: [UseDescription(meaning: "就連…也 / …之類的", usageNotes: ["名詞＋でも"], examples: ["君でもできるよ。"])]
    ),
    AdverbialParticle(
        name: "さえ (sae)",
        uses: [UseDescription(meaning: "連… (強調意外)", usageNotes: ["名詞/動詞ば形＋さえ"], examples: ["水さえ飲めば大丈夫だ。"])]
    ),
    AdverbialParticle(
        name: "こそ (koso)",
        uses: [UseDescription(meaning: "正是、才是", usageNotes: ["名詞＋こそ"], examples: ["君こそ僕の希望だ。"])]
    ),
    AdverbialParticle(
        name: "くらい / ぐらい",
        uses: [UseDescription(meaning: "大約、至少", usageNotes: ["數量詞/名詞＋くらい"], examples: ["一度くらい行ってみたい。"])]
    ),
    AdverbialParticle(
        name: "ほど (hodo)",
        uses: [
            UseDescription(meaning: "不如", usageNotes: ["A は B ほど [否定]"], examples: ["美隊は德古拉ほど速くない。"]),
            UseDescription(meaning: "越…越…", usageNotes: ["動詞假定ば＋辭書型＋ほど"], examples: ["勉強すればするほど、頭が良くなる。"]),
            UseDescription(meaning: "到...的地步", usageNotes: ["動詞辭書型＋ほど"], examples: ["驚くほど美しい景色。", "步けないほど疲れた。"])
        ]
    ),
    AdverbialParticle(
        name: "ながら（も）",
        uses: [UseDescription(meaning: "雖然…但是", usageNotes: ["名詞/動詞+ながら(も)"], examples: ["學生ながら社長をしている。"])]
    )
]

// --- 3. 視圖區 ---
struct AdverbialParticlesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("四、副助詞（用於強調或限定）")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom, 10)
            
            AdverbialParticleHeaderRow()
            
            // 使用帶背景色的容器，方便觀察是否加載成功
            VStack(alignment: .leading, spacing: 0) {
                if adverbialParticlesData.isEmpty {
                    Text("錯誤：數據未讀取到").foregroundColor(.red).padding()
                } else {
                    ForEach(adverbialParticlesData) { particle in
                        VStack(spacing: 0) {
                            AdverbialParticleRow(particle: particle)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 10)
                            Divider()
                        }
                    }
                }
            }
        }
    }
}

struct AdverbialParticleHeaderRow: View {
    var body: some View {
        HStack {
            Text("助詞").frame(width: 80)
            Divider()
            Text("意思與用法").frame(width: 150)
            Divider()
            Text("常見用法範例").frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.subheadline).fontWeight(.bold)
        .padding(.vertical, 8).padding(.horizontal)
        .background(Color.yellow.opacity(0.1))
    }
}

struct AdverbialParticleRow: View {
    let particle: AdverbialParticle
    var body: some View {
        HStack(alignment: .top) {
            Text(particle.name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.red)
                .frame(width: 80, alignment: .leading)
            Divider()
            VStack(alignment: .leading, spacing: 10) {
                ForEach(particle.uses) { usage in
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(usage.meaning).font(.callout).fontWeight(.medium)
                            ForEach(usage.usageNotes, id: \.self) { note in
                                Text("(\(note))").font(.caption2).foregroundColor(.secondary)
                            }
                        }
                        .frame(width: 140, alignment: .leading)
                        Divider()
                        VStack(alignment: .leading) {
                            ForEach(usage.examples.indices, id: \.self) { exIndex in
                                Text("(\(exIndex + 1)) \(usage.examples[exIndex])")
                                    .font(.caption).foregroundColor(.black.opacity(0.8))
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
}

struct AdverbialParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView { AdverbialParticlesView() }
    }
}
