//
//  ContentViewBanners.swift
//  BannerSample
//
//  Created by Alessio Nossa on 04/10/2023.
//

import SwiftUI
import Banner

struct ContentViewBanners: View {
    
    @State var bannersData: [BannerData] = [ BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
    ]
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Button(action: {
                withAnimation {
                    self.bannersData.append(
                        BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Info)
                    )
                }
                
            }) {
                Text("[ Info Banner ]")
            }
            Button(action: {
                withAnimation {
                    self.bannersData.append(
                        BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Success)
                    )
                }
            }) {
                Text("[ Success Banner ]")
            }
            Button(action: {
                withAnimation {
                    self.bannersData.append(
                        BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
                    )
                }
            }) {
                Text("[ Warning Banner ]")
            }
            Button(action: {
                withAnimation {
                    self.bannersData.append(
                        BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Error)
                    )
                }
            }) {
                Text("[ Error Banner ]")
            }
        }
        .banners(data: $bannersData)
    }
}

#Preview {
    ContentViewBanners()
}
