import SwiftUI
import cjdict

struct ContentView: View {
    @State var input = ""
    var cangJi5 = CangJi5Dict()
    @State var testArray: [CangWord] = []
    
    init() {
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.backgroundColor = UIColor(named: "Primary")
        coloredAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 20)
        ]
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                TextField("輸入欲查詢的字", text: $input)
                    .padding(16.0)
                    .onChange(of: input, perform: { newValue in
                        let array = cangJi5.getCangJiCode(words: newValue) as! [CangWord]
                        if (!array.isEmpty) {
                            self.testArray = array
                        } else {
                            self.testArray.removeAll()
                        }
                    })
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1.0)
                List(testArray.indices, id: \.self) { index in
                    CangDictTile(
                        word: testArray[index].word,
                        root: testArray[index].root,
                        letter: testArray[index].letter
                    )
                    .listRowInsets(EdgeInsets())
                }
                .padding(.all)
                .listStyle(.plain)
                Spacer()
            }
            
            .navigationTitle("倉頡字典")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
        ContentView()
	}
}
