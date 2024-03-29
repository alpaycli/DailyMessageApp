//
//  ItemView.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 31.05.23.
//

import CoreHaptics
import SwiftUI

struct ItemView: View {
    @EnvironmentObject var dataModel: DataModel
    
    @Environment(\.colorScheme) var colorScheme

    var content: String
    
    var description: String {
        switch content {
        case "Daily Movie Quote Messages":
            return "See different quotes from popular movies and tv-shows every day 📺"
        case "Daily Milestones":
            return "Receive daily motivational messages and set achievable life goals for personal growth and success 🌟"
        case "Daily Song Recommendation":
            return "See new songs on your screen every day to expand your music taste 🎧"
        case "Daily Water Reminder":
            return "Remember importance of drinking water with facts about it 💧"
        default:
            return ""
        }
    }
    
    var imageName: String {
        switch content {
        case "Daily Movie Quote Messages":
            return "movieQuote2"
        case "Daily Milestones":
            return "lifeGoal"
        case "Daily Song Recommendation":
            return "songs"
        case "Daily Water Reminder":
            return "waterReminder"
        default:
            return ""
        }
    }
    
    var selected: Content {
        switch content {
        case "Daily Movie Quote Messages":
            return .movieQuote
        case "Daily Milestones":
            return .lifeGoal
        case "Daily Song Recommendation":
            return .songs
        case "Daily Water Reminder":
            return .waterReminder
        default:
            return .movieQuote
        }
    }
    
    @State private var clicked = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Section {
                Image("\(imageName)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .grayscale(1)
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(content)
                        .fontDesign(.monospaced)
                        .fontWeight(.semibold)
                        .padding(.vertical, 5)
                    
                    Spacer()
                    
                    Button {
                        dataModel.selectedContent = selected
                        
                        dataModel.simpleSuccess()
                        clicked = true
                        delayText()

                    } label: {
                        Image(systemName: selected == dataModel.selectedContent ? "heart.fill" : "plus.circle.fill")
                    }
                    .foregroundColor(.primary)
                    .disabled(dataModel.selectedContent == selected)
                }
                
                Text(description)
                    .foregroundColor(.secondary)
            }
            .padding()
            .background(colorScheme == .dark ? .darkBackground : .lightBackground)
        }
        .frame(maxWidth: UIScreen.main.bounds.size.width - 30)
        .cornerRadius(10)
    }
    private func delayText() {
           // Delay of 1.5 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
               withAnimation {
                   clicked = false
               }
           }
       }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(content: "Daily Movie Quote Messages")
            .environmentObject(DataModel())
    }
}
