//
//  TabBarView.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 27.05.23.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var dataModel = DataModel()

    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Content")
                }
        }
        .environmentObject(dataModel) // Pass the same instance of DataModel
    }
}
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
