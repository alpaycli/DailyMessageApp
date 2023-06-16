import WidgetKit
import SwiftUI

struct MyWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> MyWidgetEntry {
        MyWidgetEntry(date: Date(), sharedData: Content.movieQuote)
    }

    func getSnapshot(in context: Context, completion: @escaping (MyWidgetEntry) -> Void) {
        let entry = MyWidgetEntry(date: Date(), sharedData: Content.movieQuote)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<MyWidgetEntry>) -> Void) {
        var entries: [MyWidgetEntry] = []
        
        let encodedData  = UserDefaults(suiteName: "group.com.alpaycalalli.DailyMessage")!.object(forKey: "sharedData") as? Data
        let currentDate = Date()
    
        guard let contentEncoded = encodedData else { return }
        
        let contentDecoded = try? JSONDecoder().decode(Content.self, from: contentEncoded)
        
        guard let content = contentDecoded else { return }
        
        for dayOffset in 0 ..< 7 {
            let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
            let startOfDate = Calendar.current.startOfDay(for: entryDate)
            
            let entry = MyWidgetEntry(date: startOfDate, sharedData: content)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct MyWidgetEntry: TimelineEntry {
    let date: Date
    let sharedData: Content
}

struct MessageWidgetEntryView: View {
    var entry: MyWidgetProvider.Entry
    @State var items: [Message] = Bundle.main.decode("messages.json")
    
    init(entry: MyWidgetProvider.Entry) {
        self.entry = entry
    }
    
    var newMessage: String {
        switch entry.sharedData {
        case .movieQuote:
            let newItems = items.first(where: { $0.name == "Daily Movie Quote Messages" })
            return newItems?.elements.randomElement() ?? ""
        case .lifeGoal:
            let newItems = items.first(where: { $0.name == "Daily Milestones" })
            return newItems?.elements.randomElement() ?? ""
        case .songs:
            let newItems = items.first(where: { $0.name == "Daily Song Recommendation" })
            return newItems?.elements.randomElement() ?? ""
        case .waterReminder:
            let newItems = items.first(where: { $0.name == "Daily Water Reminder" })
            return newItems?.elements.randomElement() ?? ""
        }
    }
    
    var first: String {
        return String(newMessage.split(separator: ".")[0])
    }
    
    var rest: String {
        var test = [String]()
        let arr = newMessage.split(separator: ".")
        
        for i in 1..<arr.count {
            let subsequence = arr[i]
            let string = String(subsequence)
            test.append(string + ".")
        }
        
        return test.joined()
    }


    var body: some View {
        if entry.sharedData == .lifeGoal {
            Group {
                Text(first + ".")
                    .fontWeight(.semibold)
                +
                Text(rest)
                    .fontDesign(.monospaced)
            }
            .padding()
        } else {
            Text(newMessage)
                .fontDesign(.monospaced)
                .padding()
        }
    }
}


struct MessageWidget: Widget {
    let kind: String = "MessageWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: MyWidgetProvider()) { entry in
            MessageWidgetEntryView(entry: entry)
                .environmentObject(DataModel())
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
        .supportedFamilies([.systemMedium])
    }
}

struct MessageWidget_Previews: PreviewProvider {
    static var previews: some View {
        MessageWidgetEntryView(entry: MyWidgetEntry(date: Date(), sharedData: Content.lifeGoal))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
            .environmentObject(DataModel())
    }
}
