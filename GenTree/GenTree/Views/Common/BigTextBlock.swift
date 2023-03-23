//
//  BigTextBlock.swift
//  GenTree
//
//  Created by Kurilova Daria Kirillovna on 01.03.2023.
//

import SwiftUI

struct BigTextBlock: View {
    
    @State private var expanded: Bool = false
    @State private var truncated: Bool = false
    
    private let text: String
    private let lineLimit: Int
    
    init(_ text: String, lineLimit: Int = 4) {
        self.text = text
        self.lineLimit = lineLimit
    }
    
    var body: some View {
        someText
            .font(.regular(.textSize))
            .foregroundColor(.text())
            .multilineTextAlignment(.leading)
            .lineSpacing(.lineSpacing)
    }
    
    
    //MARK: - someText
    
    var someText: some View {
        VStack(alignment: .leading, spacing: .spacing) {
            Text(text)
                .lineLimit(expanded ? nil : lineLimit)
                .background(
                    Text(text)
                        .lineLimit(lineLimit)
                        .background(
                            GeometryReader { displayedGeometry in
                                ZStack {
                                    Text(self.text)
                                        .background(GeometryReader { fullGeometry in
                                            Color.clear.onAppear {
                                                self.truncated = fullGeometry.size.height > displayedGeometry.size.height
                                            }
                                        })
                                }
                                .frame(height: .greatestFiniteMagnitude)
                            })
                        .hidden()
                )
            
            if truncated {
                HStack {
                    Spacer()
                    toggleButton
                }
            }
        }
    }
    
    //MARK: - toggleButton
    
    var toggleButton: some View {
        Button {
            self.expanded.toggle()
        } label: {
            Text(self.expanded ? String.hideText : String.readMore)
                .font(.semiBold(.textSize))
                .foregroundColor(.accent())
        }
    }
}

//MARK: - Extensions

private extension String {
    static let hideText = "скрыть текст"
    static let readMore = "читать дальше"
}

private extension CGFloat {
    static let textSize: CGFloat = 14
    static let spacing: CGFloat = 12
    static let lineSpacing: CGFloat = 5
}


//MARK: - Preview

struct BigTextBlock_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            BigTextBlock("aaaaaaa aaa")
            
            BigTextBlock("Загородный дом в стиле хай-тек, общей площадью 109 м². Террасы и балконы: 67,84 м². Габариты: 14.06x8.36 м. Гостиная, столовая и частично закрытая кухня образуют единое помещение, которое визуально расширено за счёт террасы. Дневная зона выглядит более просторно чем в проекте Zx41 за счет отсутствия стенной перегородки между кухней и столовой. Уюта добавляет камин, устроенный у внутренней стены. Рядом с гаражом спланировано большое хозяйственное помещение. В данном варианте изменено расположение лестницы на второй этаж.")
        }
    }
}
