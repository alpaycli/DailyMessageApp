import SwiftUI
import WidgetKit

enum Content: String, Codable {
    case movieQuote
    case lifeGoal
    case songs
    case waterReminder
}

class DataModel: ObservableObject {
    @Published var selectedContent: Content = .movieQuote {
        didSet {
           saveData()
           updateWidgetTimeline()
        }
    }
    
    @Published var showAlert = false
    @Published var showSuccess = false

    var topics = ["Daily Movie Quote Messages", "Daily Milestones", "Daily Song Recommendation", "Daily Water Reminder"]

    
    func convertToArray(text: String) -> [String] {
        let sentences = text.split(separator: ".")
                
        return sentences.map { $0.base }
    }
    
    func updateWidgetTimeline() {
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func saveData() {
        let data = try! JSONEncoder().encode(selectedContent)
        UserDefaults(suiteName: "group.com.alpaycalalli.DailyMessage")?.setValue(data, forKey: "sharedData")
    }
    
    func loadData() {
        let encodedData  = UserDefaults(suiteName: "group.com.alpaycalalli.DailyMessage")!.object(forKey: "sharedData") as? Data
    
        guard let contentEncoded = encodedData else { return }
        
        let contentDecoded = try? JSONDecoder().decode(Content.self, from: contentEncoded)
        
        guard contentDecoded != nil else { return }
        
        selectedContent = contentDecoded!
    }
}
