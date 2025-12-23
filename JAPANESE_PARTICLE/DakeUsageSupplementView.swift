//
//  DakeUsageSupplementView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct DakeUsageSupplementView: View {
    let summary: String = "總結來說：「だけ」表示限制與唯一性，「だけでは／だけじゃ」表示「如果只有這樣是不夠的」。它們在歌詞中扮演著情感強化與語氣轉折的重要角色。"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // 標題
            Text("📝五、「だけじゃ」的語感與用法補充")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            // 直接顯示卡片
            ForEach(dakeUsageData) { usage in
                UsageCardView(usage: usage)
            }
            
            // 總結區塊
            VStack(alignment: .leading, spacing: 10) {
                Text("總結")
                    .font(.headline)
                Text(summary)
                    .font(.body)
            }
            .padding()
            .background(Color(red: 255/255, green: 251/255, blue: 231/255))
            .overlay(
                Rectangle()
                    .frame(width: 4)
                    .foregroundColor(Color(red: 241/255, green: 196/255, blue: 15/255)),
                alignment: .leading
            )
            .cornerRadius(4)
        }
        .padding()
    }
}

struct UsageCardView: View {
    let usage: DakeUsage
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(usage.title)
                .font(.title3)
                .fontWeight(.heavy)
            
            Text(usage.description)
                .font(.body)
            
            Text("結構: \(usage.structure)")
                .font(.callout)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 12) {
                Text("範例:")
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                ForEach(usage.examples) { example in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(example.japanese)
                            .font(.body)
                        
                        Text(example.chinese)
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        // --- 核心修正：改用 SwiftUI Link 元件 ---
                        if let context = example.context {
                            if let urlString = example.url, let url = URL(string: urlString) {
                                Link(destination: url) {
                                    Text("[\(context)]")
                                        .font(.caption2)
                                        .foregroundColor(.blue)
                                        .underline()
                                }
                            } else {
                                // 沒有連結則顯示橘色文字
                                Text("[\(context)]")
                                    .font(.caption2)
                                    .foregroundColor(.orange)
                            }
                        }
                    }
                    .padding(.leading, 5)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}
