//
//  DakeUsageSupplementView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct DakeUsageSupplementView: View {
    // 狀態變數：控制 Safari 視窗
    @State private var selectedURL: URL?
    
    let summary: String = "總結來說：「だけ」表示限制與唯一性，「だけ則為／だけじゃ」表示「如果只有這樣是不夠的」。它們在歌詞中扮演著情感強化與語氣轉折的重要角色。"
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // 標題
            Text("📝「だけじゃ」的語感與用法補充")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            // 使用修正後的子元件來顯示卡片
            ForEach(dakeUsageData) { usage in
                UsageCardView(usage: usage, selectedURL: $selectedURL)
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
        // 關鍵：這行負責彈出網頁
        .sheet(item: $selectedURL) { url in
            SafariView(url: url)
        }
    }
}

// 修改後的卡片元件：將 URL 跳轉邏輯整合進去
struct UsageCardView: View {
    let usage: DakeUsage
    @Binding var selectedURL: URL? // 透過 Binding 傳回給父元件顯示 Safari
    
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
                        
                        // 處理歌曲名稱超連結
                        if let context = example.context {
                            Button(action: {
                                if let urlString = example.url, let url = URL(string: urlString) {
                                    selectedURL = url
                                }
                            }) {
                                Text("[\(context)]")
                                    .font(.caption2)
                                    .foregroundColor(example.url != nil ? .blue : .orange)
                                    .underline(example.url != nil)
                            }
                            .disabled(example.url == nil)
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

// 預覽與延伸
struct DakeUsageSupplementView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            DakeUsageSupplementView()
        }
    }
}

extension URL: Identifiable {
    public var id: String { self.absoluteString }
}
