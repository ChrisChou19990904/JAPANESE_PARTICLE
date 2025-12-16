//
//  CaseParticlesView.swift
//  JAPANESE_PARTICLE
//
//  Created by fcuiecs on 2025/12/16.
//
import SwiftUI

struct CaseParticlesView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 模擬 HTML H2 標題
            Text("一、格助詞（表示句子成分功能）")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)
                .padding(.top)
            
            // 標題行 (模擬表格的 thead)
            ParticleHeaderRow()
            
            // 內容列表
            List {
                ForEach(caseParticlesData) { particle in
                    ParticleRow(particle: particle)
                        .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .listRowSeparator(.hidden) // 隱藏 List 的分隔線
                }
            }
            .listStyle(.plain) // 使用簡潔的列表樣式
        }
    }
}

// 助詞表格的標題列 (Header)
struct ParticleHeaderRow: View {
    var body: some View {
        HStack {
            Text("助詞")
                .frame(width: 60)
            Divider()
            Text("功能")
                .frame(width: 150)
            Divider()
            Text("例句")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.subheadline)
        .fontWeight(.bold)
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.1)) // 模擬表格標題的底色
        .border(width: 1, edges: [.top, .bottom], color: .gray) // 模擬表格邊框
    }
}

// 助詞表格的內容行 (Row)
struct ParticleRow: View {
    let particle: CaseParticle
    
    var body: some View {
        HStack(alignment: .top) {
            // 欄位 1: 助詞
            Text(particle.name)
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.blue)
                .frame(width: 60, alignment: .leading)
            
            Divider()
            
            // 欄位 2: 功能
            VStack(alignment: .leading) {
                ForEach(particle.functions, id: \.self) { function in
                    Text("• \(function)")
                        .font(.callout)
                        .padding(.vertical, 1)
                }
            }
            .frame(width: 150, alignment: .leading)
            
            Divider()
            
            // 欄位 3: 例句
            VStack(alignment: .leading) {
                ForEach(particle.examples.indices, id: \.self) { index in
                    Text("(\(index + 1)) \(particle.examples[index])")
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.8))
                        .padding(.vertical, 2)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

// 邊框輔助 View (用來模擬 HTML 表格邊框)
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .leading: return rect.minX
                case .trailing: return rect.maxX - width
                default: return rect.minX
                }
            }
            
            var y: CGFloat {
                switch edge {
                case .top: return rect.minY
                case .bottom: return rect.maxY - width
                default: return rect.minY
                }
            }
            
            var w: CGFloat {
                switch edge {
                case .leading, .trailing: return width
                default: return rect.width
                }
            }
            
            var h: CGFloat {
                switch edge {
                case .top, .bottom: return width
                default: return rect.height
                }
            }
            
            path.addRect(CGRect(x: x, y: y, width: w, height: h))
        }
        return path
    }
}
