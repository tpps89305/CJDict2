import SwiftUI
import cjdict

struct ContentView: View {
    
    @StateObject var prospects = Prospects()
    let settings = SettingHandler(context: NSObject())
    
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
        TabView(selection: $prospects.tabSelection) {
            HomeView().tabItem {
                Image(systemName: "iphone.homebutton")
                Text("主畫面")
            }.tag(1)
            
            CollectionsView().tabItem {
                Image(systemName: "folder")
                Text("收藏簿")
            }.tag(2)
            
            SettingsView().tabItem {
                Image(systemName: "gearshape")
                Text("設定")
            }.tag(3)
        }
        .environmentObject(prospects)
        .preferredColorScheme(prospects.isPreferrScheme ? prospects.theme : .none)
        .onAppear {
            switch settings.getTheme() {
            case 1:
                prospects.isPreferrScheme = true
                prospects.theme = .light
            case 2:
                prospects.isPreferrScheme = true
                prospects.theme = .dark
            default:
                prospects.isPreferrScheme = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        ContentView()
	}
}
