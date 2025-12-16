//
//  AdverbialParticleView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct AdverbialParticlesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // 模擬 HTML H2 標題
            Text("四、副助詞（用於強調或限定）")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            // 標題行 (Header)
            AdverbialParticleHeaderRow()
            
            // 內容列表
            List {
                ForEach(adverbialParticlesData) { particle in
                    AdverbialParticleRow(particle: particle)
                        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
    }
}

// 副助詞表格的標題列 (Header)
struct AdverbialParticleHeaderRow: View {
    var body: some View {
        HStack {
            Text("助詞")
                .frame(width: 80)
            Divider()
            Text("意思與用法")
                .frame(width: 150)
            Divider()
            Text("常見用法範例")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.yellow.opacity(0.1)) // 使用不同顏色區分副助詞
        // .border(width: 1, edges: [.top, .bottom], color: .gray)
    }
}

// 副助詞表格的內容行 (Row)
struct AdverbialParticleRow: View {
    let particle: AdverbialParticle
    
    var body: some View {
        HStack(alignment: .top) {
            // 欄位 1: 助詞名稱
            Text(particle.name)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.red)
                .frame(width: 80, alignment: .leading)
            
            Divider()
            
            // 欄位 2 & 3: 用法和範例 (垂直堆疊顯示多個用法)
            VStack(alignment: .leading, spacing: 5) {
                
                ForEach(particle.uses.indices, id: \.self) { useIndex in
                    let usage = particle.uses[useIndex]
                    
                    HStack(alignment: .top) {
                        // 用法/意思
                        VStack(alignment: .leading) {
                            Text("\(useIndex + 1). \(usage.meaning)")
                                .font(.callout)
                                .fontWeight(.medium)
                            
                            // 顯示語法說明
                            ForEach(usage.usageNotes, id: \.self) { note in
                                Text("(\(note))")
                                    .font(.caption2)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Divider()
                        
                        // 例句
                        VStack(alignment: .leading) {
                            ForEach(usage.examples.indices, id: \.self) { exampleIndex in
                                Text("(\(exampleIndex + 1)) \(usage.examples[exampleIndex])")
                                    .font(.caption)
                                    .foregroundColor(.black.opacity(0.8))
                                    .padding(.vertical, 1)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    // 多個用法之間使用分隔線
                    if useIndex < particle.uses.count - 1 {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 0.5)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
    }
}

// 預覽 (如何在 Xcode 中看到效果)
struct AdverbialParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        AdverbialParticlesView()
    }
}
