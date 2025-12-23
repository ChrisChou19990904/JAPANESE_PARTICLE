//
//  ConjunctiveParticlesView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct ConjunctiveParticlesView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 模擬 HTML H2 標題
            Text("二、接續助詞（連接句子）")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            // 助詞說明
            Text("這些助詞用於連接兩個句子，表達原因、理由或轉折關係。")
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.bottom, 10)

            // 標題行
            ConjunctiveParticleHeaderRow()
            
            // ✅ 修改重點：將 List 替換為 VStack + ForEach
            VStack(alignment: .leading, spacing: 0) {
                ForEach(conjunctiveParticlesData) { particle in
                    VStack(spacing: 0) {
                        ConjunctiveParticleRow(particle: particle)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                        
                        Divider() // 手動加入分隔線，模擬 List 的效果
                    }
                }
            }
        }
    }
}

// 接續助詞表格的標題列 (Header)
struct ConjunctiveParticleHeaderRow: View {
    var body: some View {
        HStack {
            Text("助詞")
                .frame(width: 80)
            Divider()
            Text("功能與說明")
                .frame(width: 150)
            Divider()
            Text("例句")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1))
        .border(width: 1, edges: [.top, .bottom], color: .gray)
    }
}

// 接續助詞表格的內容行 (Row)
struct ConjunctiveParticleRow: View {
    let particle: ConjunctiveParticle
    
    var body: some View {
        HStack(alignment: .top) {
            // 欄位 1: 助詞
            VStack(alignment: .leading) {
                Text(particle.name)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.orange)
                Text(particle.description)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(width: 80, alignment: .leading)
            
            Divider()
            
            // 欄位 2: 功能
            VStack(alignment: .leading) {
                ForEach(particle.functions, id: \.self) { function in
                    Text("• \(function)")
                        .font(.callout)
                        .padding(.vertical, 1)
                }
            }
            .frame(width: 150, alignment: .leading)
            
            Divider()
            
            // 欄位 3: 例句
            VStack(alignment: .leading, spacing: 5) {
                ForEach(particle.examples) { exampleSet in
                    VStack(alignment: .leading) {
                        ForEach(exampleSet.sentences.indices, id: \.self) { index in
                            Text("(\(index + 1)) \(exampleSet.sentences[index])")
                                .font(.caption)
                                .foregroundColor(.black.opacity(0.8))
                                .padding(.vertical, 1)
                        }
                    }
                    if particle.examples.count > 1 {
                        // 模擬 HTML 中的 <hr> 分隔線
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(height: 0.5)
                            .padding(.vertical, 4)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// 預覽 (如何在 Xcode 中看到效果)
struct ConjunctiveParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        ConjunctiveParticlesView()
    }
}
