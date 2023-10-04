import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                List {
                    NavigationLink("Single") {
                        ContentView()
                    }
                    
                    NavigationLink("Multiple") {
                        ContentViewBanners()
                    }
                }

                .listStyle(.inset)
                .navigationTitle("Banner Sample")
            }
        }
    }
}
