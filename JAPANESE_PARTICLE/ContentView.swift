// ContentView.swift

import SwiftUI

// 這裡不需要重新定義 ParticleAnchor，因為它已經在 AnchorDefinitions.swift 中定義了。

// ContentView.swift

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollViewReader { proxy in
                VStack(alignment: .leading, spacing: 0) {
                    
                    // 1. 導航目錄
                    CatalogMenu(proxy: proxy)
                    
                    // 2. 主要內容滾動區域
                    ScrollView {
                        VStack(alignment: .leading, spacing: 40) {
                            
                            // 一、格助詞 (使用真正的 View，不再使用 Placeholder)
                            CaseParticlesView()
                                .id(ParticleAnchor.particle1)
                            
                            // 二、接續助詞
                            ConjunctiveParticlesView()
                                .id(ParticleAnchor.particle2)
                            
                            // 三、終助詞 (請確保您有建立 SentenceEndingParticlesView)
                            SentenceEndingParticlesView()
                                .id(ParticleAnchor.particle3)
                            
                            // 四、副助詞
                            AdverbialParticlesView()
                                .id(ParticleAnchor.particle4)
                            
                            // 五、「だけ」補充
                            DakeUsageSupplementView()
                                .id(ParticleAnchor.dake)
                            
                            // 六、常見混淆
                            ConfusionContrastView()
                                .id(ParticleAnchor.confusion)
                            
                            // 七、課後測驗題
                            QuizView()
                                .id(ParticleAnchor.test)
                            
                        }
                        .padding(.vertical, 20)
                    }
                }
                .navigationTitle("日文助詞一覽")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
