//
//  DakeUsageSupplementView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct DakeUsageSupplementView: View {
    
    // 總結卡片
    let summary: String = "總結來說：「だけ」表示限制與唯一性，「だけでは／だけじゃ」表示「如果只有這樣是不夠的」。它們在歌詞中扮演著情感強化與語氣轉折的重要角色。"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            // 模擬 HTML H2 標題
            Text("📝「だけ」、「だけでは」、「だけじゃ」的語感與用法補充")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            // 核心說明與卡片呈現
            ForEach(dakeUsageData) { usage in
                UsageCardView(usage: usage)
            }
            
            // 總結區塊 (模擬 HTML 中的 .note/summary)
            VStack(alignment: .leading, spacing: 10) {
                Text("總結")
                    .font(.headline)
                Text(summary)
                    .font(.body)
            }
            .padding()
            // 模擬 .intro-box 樣式
            .background(Color(red: 255/255, green: 251/255, blue: 231/255)) // #fffbe7
            .overlay(
                Rectangle()
                    .frame(width: 4)
                    .foregroundColor(Color(red: 241/255, green: 196/255, blue: 15/255)), // #f1c40f
                alignment: .leading
            )
            .cornerRadius(4)
        }
        .padding()
    }
}

// 單個用法 (如「だけ」或「だけでは」) 的卡片視圖
struct UsageCardView: View {
    let usage: DakeUsage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(usage.title)
                .font(.title3)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            Text(usage.description)
                .font(.body)
                .padding(.bottom, 5)
            
            // 語法結構
            Text("結構: \(usage.structure)")
                .font(.callout)
                .foregroundColor(.blue)
            
            // 例句
            VStack(alignment: .leading, spacing: 8) {
                Text("範例:")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                ForEach(usage.examples) { example in
                    VStack(alignment: .leading) {
                        Text(example.japanese)
                            .font(.body)
                            .lineSpacing(4)
                        
                        Text(example.chinese)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        if let context = example.context {
                            Text("[\(context)]")
                                .font(.caption2)
                                .foregroundColor(.orange)
                        }
                    }
                    .padding(.leading, 5)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}

// 預覽
struct DakeUsageSupplementView_Previews: PreviewProvider {
    static var previews: some View {
        DakeUsageSupplementView()
    }
}
