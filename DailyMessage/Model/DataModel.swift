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
            let data = try! JSONEncoder().encode(selectedContent)
            UserDefaults(suiteName: "group.com.alpaycalalli.DailyMessage")?.setValue(data, forKey: "sharedData")
            //updateWidgetTimeline()
        }
    }
    
    @Published var showAlert = false
    @Published var showSuccess = false

    
    var topics = ["Daily Movie Quote Messages", "Daily Milestones", "Daily Song Recommendation", "Daily Water Reminder"]
    
    /*var movieQuoteMessages = [
    "“You know what the happiest animal on Earth is? It's a goldfish. It has a 10-second memory. Be a goldfish.“ - Ted Lasso",
    
    "“It’s only after we’ve lost everything that we’re free to do anything.” – Fight Club, Tyler Durden",
    
    "“Remember those posters that said, “Today is the first day of the rest of your life”? Well, that’s true of every day but one…the day you die.” – American Beauty",
    
    "“I believe whatever doesn’t kill you, simply makes you…stranger.” – The Dark Knight, The Joker",
    
    "”I love meeting people's moms. It's like reading an instruction manual as why they're nuts.” - Ted Lasso",
    
        "”A guy opens his door and gets shot and you think that of me? No. I am the one who knocks!” - Breaking Bad, Walter White",
    
        "”It’s what you do right now that makes a difference.” - Black Hawk Down",
    
        "”Do, or do not. There is no “try”” - Star Wars: Episode V – The Empire Strikes Back"
    // "””"
    // "””"
    
]
    var lifeGoalMessages = [
        "Read a book. Cultivate the habit of expanding knowledge and gaining new perspectives. Strengthen your imagination, critical thinking skills.",
        
        "Learn a new language. Embark on acquiring a new language, improving communication skills, connecting with cultures, people, and ideas.",
        
        "Start a meditation practice. Establish a regular meditation practice for inner peace, mindfulness, and self-awareness.",
        
        "Travel. Explore a new country, its traditions and natural beauty. Expand your cultural horizons, broaden your worldview, and create memories.",
        
        "Volunteer for a Cause. Contribute to a cause you're passionate about, making a positive impact and inspiring others through active volunteer work.",
        
        "Pursue a Creative Hobby. Engage in an artistic or creative pursuit, nurturing your creativity and experiencing the joy of self-expression.",
        
        "Achieve Physical Fitness.  Prioritize your physical well-being, improving your strength, stamina and overall energy through regular exercise.",
        
        "Build a Strong Support Network. Surround yourself with a supportive community, and cultivate deep connections with uplifting individuals.",
        
        "Develop a Financial Plan. Take control of your financial future through clear goals, budgeting, and smart saving and investment strategies.",
        
        "Cultivate a Healthy Work-Life Balance. Strive for a balance between work and personal life, prioritizing self-care and enjoying time with loved ones."
    ]
    var songs = [
        "”Marriage Suite” - Aziza Mustafazadeh",
        "”Hypnotized” - Fleetwood Mac",
        "”Night bells” - Eldar Mansurov",
        "”505” - Arctic Monkeys",
        "”After Hours” - The Weeknd",
        "”Three Little Birds” - Bob Marley & The Wailers",
        "”Before Midnight Tonight” - Hugo Kant",
        "”Best Friend” - Rex Orange Country",
        "”The Winner Takes It All” - ABBA",
        "”Sure the Sun Will Rise” - Hugo Kant",
        "”Everybody Knows” - Leonard Cohen",
        "”You Shall Rise” - Mononome",
        "”Words Remain” - Moderator",
        "”Unfallen Kingdom” - Gramatik",
        "”” - ",
        "”” - ",
        "”” - ",
        "”” - "
    ]
    var waterMessages = [
        "Water Helps Keep Skin Looking Good. Drink water to maintain healthy and radiant skin.",
        
        "Drinking water helps maximize physical performance. Stay hydrated to optimize your workouts and daily activities.",
        
        "Water can aid in weight loss. Stay hydrated to support your body's natural metabolism and feel fuller.",
        
        "Water improves blood oxygen circulation, keeping your body functioning properly. Remember to drink enough water to support your overall health.",
        
        "Not getting enough water can affect your mood. Dehydration may result in fatigue, confusion, and even anxiety. Stay hydrated for better mental well-being.",
        
        "Water is essential for proper digestion. Stay hydrated to support a healthy digestive system.",
        
        "Drinking water helps maintain optimal brain function. Stay hydrated to enhance focus and mental clarity.",
        
        "Water plays a crucial role in regulating body temperature. Stay hydrated to prevent overheating and maintain a balanced body temperature.",
        
        "Water is essential for flushing out toxins from the body. Stay hydrated to support your body's natural detoxification processes.",
        
        "Drinking water can help prevent and alleviate headaches. Stay hydrated to reduce the frequency and intensity of headaches.",
        
        "Water is vital for joint health and lubrication. Stay hydrated to support healthy and pain-free joints.",
        
        "Proper hydration is important for maintaining kidney health. Drink water to support kidney function and prevent urinary tract problems.",
        
        "Water is necessary for the proper functioning of the cardiovascular system. Stay hydrated to support a healthy heart and circulation.",
        
        "Water helps in the absorption and transportation of nutrients. Stay hydrated to ensure your body can effectively utilize the nutrients from your diet.",
        
        "Drinking water can help prevent muscle cramps and improve muscle function. Stay hydrated to optimize your physical performance.",
        
        "Water is a natural energy booster. Stay hydrated to combat fatigue and maintain optimal energy levels throughout the day."
    ]
     */
    

    func updateWidgetTimeline() {
        WidgetCenter.shared.reloadAllTimelines()
        print()
    }
    
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
