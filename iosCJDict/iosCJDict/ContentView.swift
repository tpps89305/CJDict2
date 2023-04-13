import SwiftUI
import cjdict

struct ContentView: View {
    @State var input = ""
    @State var result = ""
    var cangJi5 = CangJi5Dict()

	var body: some View {
        VStack {
            HStack {
                TextField("輸入欲查詢的字", text: $input)
                Button("查詢") {
                    var array = cangJi5.getCangJiCode(words: input) as! [CangWord]
                    if (!array.isEmpty) {
                        self.result = array[0].root
                    }
                }
            }
            Text(result)
        }
        .padding(10.0)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
