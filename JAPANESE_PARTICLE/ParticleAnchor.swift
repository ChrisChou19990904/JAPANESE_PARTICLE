//
//  ParticleAnchor.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
// 助詞教學的錨點 ID 列表
enum ParticleAnchor: String, CaseIterable, Identifiable {
    case particle1 = "格助詞的說明"
    case particle2 = "接續助詞的說明"
    case particle3 = "終助詞的說明"
    case particle4 = "副助詞的說明"
    case dake = "「だけ」的補充說明"
    case confusion = "常見的混淆對比"
    case test = "課後測驗題"
    
    var id: String { self.rawValue } // 讓 enum 可用於 ForEach
    
    // 將 HTML 中的編號加入到顯示名稱
    var displayName: String {
        switch self {
        case .particle1: return "1. \(self.rawValue)"
        case .particle2: return "2. \(self.rawValue)"
        case .particle3: return "3. \(self.rawValue)"
        case .particle4: return "4. \(self.rawValue)"
        case .dake: return "5. \(self.rawValue)"
        case .confusion: return "6. \(self.rawValue)"
        case .test: return "7. \(self.rawValue)"
        }
    }
}
