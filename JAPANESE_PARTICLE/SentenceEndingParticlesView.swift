//
//  SentenceEndingParticlesView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct SentenceEndingParticlesView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // 模擬 HTML H2 標題
            Text("三、終助詞（用於句尾，表語氣）")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            // 標題行 (Header)
            EndingParticleHeaderRow()
            
            // 內容列表
            List {
                ForEach(sentenceEndingParticlesData) { particle in
                    EndingParticleRow(particle: particle)
                        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
    }
}

// 終助詞表格的標題列 (Header)
struct EndingParticleHeaderRow: View {
    var body: some View {
        HStack {
            Text("助詞")
                .frame(width: 50)
            Divider()
            Text("語氣功能")
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
        // 為了使用 border extension，這裡假設您已將上一個回答中的 EdgeBorder extension 加入專案
        // .border(width: 1, edges: [.top, .bottom], color: .gray)
    }
}

// 終助詞表格的內容行 (Row)
struct EndingParticleRow: View {
    let particle: SentenceEndingParticle
    
    var body: some View {
        HStack(alignment: .top) {
            // 欄位 1: 助詞
            Text(particle.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.purple)
                .frame(width: 50, alignment: .leading)
            
            Divider()
            
            // 欄位 2: 功能
            Text(particle.function)
                .font(.callout)
                .frame(width: 150, alignment: .leading)
            
            Divider()
            
            // 欄位 3: 例句
            VStack(alignment: .leading) {
                Text(particle.example)
                    .font(.callout)
                    .foregroundColor(.black.opacity(0.8))
                Text(particle.meaning)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// 預覽 (如何在 Xcode 中看到效果)
struct SentenceEndingParticlesView_Previews: PreviewProvider {
    static var previews: some View {
        SentenceEndingParticlesView()
    }
}
