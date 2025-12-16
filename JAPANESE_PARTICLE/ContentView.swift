// ContentView.swift

import SwiftUI

// 這裡不需要重新定義 ParticleAnchor，因為它已經在 AnchorDefinitions.swift 中定義了。

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    // 1. 導航目錄
                    // CatalogMenu 使用 ParticleAnchor 構造選單
                    CatalogMenu(proxy: proxy)
                    
                    // 2. 主要內容滾動區域
                    ScrollView {
                        VStack(alignment: .leading, spacing: 40) {
                            
                            // 每個 View 都使用 ParticleAnchor 作為 ID
                            CaseParticlesView().id(ParticleAnchor.particle1)
                            ConjunctiveParticlesView().id(ParticleAnchor.particle2)
                            // ... (其他 Views)
                            QuizView().id(ParticleAnchor.test)
                            
                        }
                        // ...
                    }
                }
                // ...
            }
        }
    }
}
