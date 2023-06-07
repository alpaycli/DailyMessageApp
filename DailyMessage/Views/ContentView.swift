import SwiftUI
import SPAlert

struct ContentView: View {
    @EnvironmentObject var dataModel: DataModel
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    ForEach(dataModel.topics, id: \.self) { item in
                        ItemView(content: item)
                            .environmentObject(dataModel)
                            .padding(.vertical)
                    }
                }
                .navigationTitle("Content")
                .scrollIndicators(.hidden)
                
                if dataModel.showAlert {
                    CustomAlertView(selected: dataModel.selectedContent)
                        .environmentObject(dataModel)
                }
            }
            .onAppear(perform: dataModel.loadData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(DataModel())
            .previewDevice("iPhone SE")
        
        ContentView()
            .environmentObject(DataModel())
            .previewDevice("iPhone X")
        
        ContentView()
            .environmentObject(DataModel())
            .previewDevice("iPhone 14 Pro")
        
    }
}
