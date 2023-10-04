import SwiftUI
import Banner

struct ContentView: View {
    
    @State var showBanner:Bool = false
    @State var bannerData: BannerData? = BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            Button(action: {
                withAnimation {
                    self.bannerData = BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Info)
                }
            }) {
                Text("[ Info Banner ]")
            }
            Button(action: {
                withAnimation {
                    self.bannerData = BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Success)
                }
            }) {
                Text("[ Success Banner ]")
            }
            Button(action: {
                withAnimation {
                    self.bannerData = BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Warning)
                }
            }) {
                Text("[ Warning Banner ]")
            }
            Button(action: {
                withAnimation {
                    self.bannerData = BannerData(title: "Notification Title", detail: "Notification text for the action you were trying to perform.", type: .Error)
                }
            }) {
                Text("[ Error Banner ]")
            }
        }
        .banner(data: $bannerData)
    }
}

#Preview {
    ContentView()
}
