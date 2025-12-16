//
//  ParticleCatalogView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct ParticleCatalogView: View {
    
    var body: some View {
        NavigationView {
            // 使用 ScrollViewReader 包裹整個可滾動區域
            ScrollViewReader { proxy in
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    // --- 頂部目錄區 (Catalog) ---
                    CatalogMenu(proxy: proxy)
                    
                    // --- 內容展示區 (Content) ---
                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            
                            ForEach(ParticleAnchor.allCases) { anchor in
                                
                                // 每個標題就是一個錨點
                                Text(anchor.displayName)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(red: 44/255, green: 62/255, blue: 80/255)) // #2c3e50
                                    .padding(.top, 20)
                                    // 設置唯一的 ID，這是錨點的關鍵！
                                    .id(anchor)
                                
                                // 這裡放置該助詞類型的實際教學內容
                                ContentPlaceholder(anchor: anchor)
                                
                                Divider()
                            }
                        }
                        .padding()
                        .padding(.bottom, 50) // 底部留白
                    }
                }
                .navigationTitle("日文助詞一覽")
            }
        }
    }
}

// 目錄選單元件
struct CatalogMenu: View {
    // 接受 ScrollViewProxy 來執行滾動
    let proxy: ScrollViewProxy
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("目錄")
                .font(.headline)
                .padding(.bottom, 5)
            
            // 將目錄項目以 Grid 方式顯示，增加可讀性
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 10) {
                
                ForEach(ParticleAnchor.allCases) { anchor in
                    Button(action: {
                        // 點擊按鈕，執行滾動到目標 ID
                        withAnimation {
                            proxy.scrollTo(anchor, anchor: .top)
                        }
                    }) {
                        Text(anchor.displayName)
                            .lineLimit(1)
                            .minimumScaleFactor(0.7)
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .background(Color.cyan.opacity(0.1))
                            .cornerRadius(8)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .padding()
        // 模擬 HTML 中的 .catalog 樣式
        .background(Color(red: 224/255, green: 247/255, blue: 250/255)) // #e0f7fa
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.cyan, lineWidth: 4)
                .padding(.horizontal, 1)
        )
    }
}

// 內容佔位元件 (未來替換為真正的表格內容)
struct ContentPlaceholder: View {
    let anchor: ParticleAnchor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("這是 **\(anchor.rawValue)** 的教學內容。")
                .foregroundColor(.gray)
                .padding(.bottom)
            
            // 只是為了讓 ScrollView 能滾動，未來會替換成您的表格
            Rectangle()
                .fill(Color.gray.opacity(0.1))
                .frame(height: (anchor == .test ? 600 : 300)) // 測驗題留更多空間
                .overlay(Text("這裡將放入助詞表格或測驗邏輯"))
        }
    }
}

// 預覽 (如何在 Xcode 中看到效果)
struct ParticleCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        ParticleCatalogView()
    }
}
