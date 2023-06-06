//
//  CustomAlertView.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 30.05.23.
//

import SwiftUI

struct CustomAlertView: View {
    @EnvironmentObject var dataModel: DataModel
    
    var selected: Content
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            VStack {
                Text("\(selected.rawValue)")
                    .font(.title3)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Button("Set Widget") {
                    dataModel.updateWidgetTimeline()
                    dataModel.showAlert = false
                    dataModel.simpleSuccess()
                    
                    dataModel.showSuccess = true
                }
                .padding()
                .background(.blue)
                .clipShape(Capsule())
                .buttonStyle(.plain)
                
            }
            .padding(30)
            .frame(maxWidth: 300)
            .background(.black.opacity(0.85))
            .cornerRadius(25)
            .transition(.scale)
        }
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(selected: .lifeGoal)
    }
}
