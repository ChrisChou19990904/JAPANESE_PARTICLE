//
//  ConfusionContrastView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct ConfusionContrastView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // 模擬 HTML H2 標題
            Text("五、常見混淆對比")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)

            ForEach(confusionContrastsData) { contrast in
                ContrastCardView(contrast: contrast)
            }
        }
        .padding()
    }
}

// 單一對比組件 (Card View)
struct ContrastCardView: View {
    let contrast: ConfusionContrast
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // 標題 (例如：「は」 vs 「が」)
            Text(contrast.title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 44/255, green: 62/255, blue: 80/255)) // #2c3e50
            
            // 規則說明
            VStack(alignment: .leading, spacing: 5) {
                ForEach(contrast.comparison, id: \.self) { rule in
                    Text("- \(rule)")
                        .font(.callout)
                }
            }
            .padding(.bottom, 5)
            
            // 例句
            VStack(alignment: .leading, spacing: 5) {
                Text("例：")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                ForEach(contrast.examples) { example in
                    ExampleTextView(japanese: example.japanese, meaning: example.meaning)
                        // 模擬 HTML .example 樣式
                        .padding(8)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(red: 232/255, green: 240/255, blue: 254/255)) // #e8f0fe
                        .overlay(
                            Rectangle()
                                .frame(width: 5)
                                .foregroundColor(Color(red: 66/255, green: 133/255, blue: 244/255)), // #4285f4
                            alignment: .leading
                        )
                        .cornerRadius(4)
                }
            }
        }
        .padding()
        // 模擬 HTML .note 樣式
        .background(Color(red: 255/255, green: 243/255, blue: 205/255)) // #fff3cd
        .overlay(
            Rectangle()
                .frame(width: 5)
                .foregroundColor(Color(red: 255/255, green: 234/255, blue: 186/255)), // #ffeeba
            alignment: .leading
        )
        .cornerRadius(4)
    }
}

// 組合日文和中文意思的視圖
struct ExampleTextView: View {
    let japanese: String
    let meaning: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(japanese)
                .font(.body)
                .lineSpacing(4)
            Text(meaning)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

// 預覽
struct ConfusionContrastView_Previews: PreviewProvider {
    static var previews: some View {
        ConfusionContrastView()
    }
}
