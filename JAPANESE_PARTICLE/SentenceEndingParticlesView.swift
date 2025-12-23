//
//  SentenceEndingParticlesView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct SentenceEndingParticlesView: View {
    var body: some View {
        // 將外層的 List 換成 VStack，這樣內容才能在 ScrollView 中正常展開
        VStack(alignment: .leading, spacing: 0) {
            
            // 模擬 HTML H2 標題
            Text("三、終助詞（用於句尾，表語氣）")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom, 10)
            
            // 標題行 (Header)
            EndingParticleHeaderRow()
            
            // 使用 ForEach 代替 List
            VStack(alignment: .leading, spacing: 0) {
                ForEach(sentenceEndingParticlesData) { particle in
                    VStack(spacing: 0) {
                        EndingParticleRow(particle: particle)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                        
                        Divider() // 手動加入分隔線
                    }
                }
            }
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
