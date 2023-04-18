import SwiftUI
import cjdict

struct ContentView: View {
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor(named: "Primary")
        coloredAppearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "Title")!,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        coloredAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor(named: "Title")!,
        ]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    var body: some View {
        TabView {
            HomeView().tabItem {
                Image(systemName: "iphone.homebutton")
                Text("主畫面")
            }.tag(1)
            SettingsView().tabItem {
                Image(systemName: "gearshape")
                Text("設定")
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        ContentView()
	}
}
