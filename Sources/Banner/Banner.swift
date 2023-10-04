//
//  Banner.swift
//  BannersSwiftUI
//
//  Created by Jean-Marc Boullianne on 11/30/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

public struct BannerData: Identifiable {
    public let id = UUID()
    public let title: String
    public let detail: String
    public var type: BannerType
    
    public init(title: String, detail: String, type: BannerType) {
        self.title = title
        self.detail = detail
        self.type = type
    }
}

public enum BannerType {
    case Info
    case Warning
    case Success
    case Error
    
    var tintColor: Color {
        switch self {
        case .Info:
            return Color(red: 67/255, green: 154/255, blue: 215/255)
        case .Success:
            return Color.green
        case .Warning:
            return Color.yellow
        case .Error:
            return Color.red
        }
    }
}

public struct BannersModifier: ViewModifier {
    
    // Members for the Banner
    @Binding var data: [BannerData]
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            
            VStack {
                ForEach(data) { bannerData in
                    Banner(data: bannerData) {
                        withAnimation {
                            if let index = data.firstIndex(where: { $0.id == bannerData.id }) {
                                data.remove(at: index)
                            }
                        }
                        
                    }
                }
                
                Spacer()
            }
        }
    }

}

public extension View {
    func banner(data: Binding<BannerData?>) -> some View {
        let mappedBinding = Binding<[BannerData]>(get: {
            [ data.wrappedValue ].compactMap { $0 }
        }, set: { bannerData in
            data.wrappedValue = bannerData.first
        })
        
        return self.modifier(
            BannersModifier(data: mappedBinding)
        )
    }
    
    func banners(data: Binding<[BannerData]>) -> some View {
        self.modifier(BannersModifier(data: data))
    }
}

struct Banner: View {
    let data: BannerData
    let dismiss: () -> ()
    
    var displayTime: Double {
        max(Double(data.title.count + data.detail.count) * 1.0/20.0, 4.0)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text(data.title)
                        .bold()
                    Text(data.detail)
                        .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                }
                Spacer()
            }
            .foregroundColor(Color.white)
            .padding(12)
            .background(data.type.tintColor)
            .cornerRadius(8)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .transition(AnyTransition.move(edge: .top).combined(with: .opacity))
        .onTapGesture {
            dismiss()
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + displayTime) {
                dismiss()
            }
        })
    }
}
