//
//  CardView.swift
//  DailyMessage
//
//  Created by Alpay Calalli on 16.06.23.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var dataModel: DataModel
    
    @Environment(\.colorScheme) var colorScheme
    
    var content: String
    
    var emoji: String {
        switch content {
        case "Daily Movie Quote Messages":
            return " 🎬"
        case "Daily Milestones":
            return " 🌎"
        case "Daily Song Recommendation":
            return " 🎶"
        case "Daily Water Reminder":
            return " 🚰"
        default:
            return ""
        }
    }
    
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
        VStack(alignment: .leading) {
            Group {
                Text(content + emoji)
                    .font(.headline)
                    .padding(.top, 15)
                    .padding(.bottom, 10)
                
                HStack {
                    Text(description)
                        .font(.subheadline)
                    
                    Spacer()
                    
                    Button {
                        dataModel.selectedContent = selected
                        
                        dataModel.simpleSuccess()
                        clicked = true
                        delayText()
                    } label: {
                        Image(systemName: selected == dataModel.selectedContent ? "heart.fill" : "plus.circle.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.primary)
                  //  .buttonStyle(PlainButtonStyle())
                    .disabled(dataModel.selectedContent == selected)
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
            .foregroundColor(.primary)
        }
        .frame(maxWidth: 330)
        .background(colorScheme == .dark ? .darkBackground : .lightBackground)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0, y: 2)
        .padding()
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

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: "Daily Movie Quote Messages")
            .environmentObject(DataModel())
    }
}
