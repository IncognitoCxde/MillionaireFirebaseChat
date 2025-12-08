import SwiftUI
import Firebase

@main
struct FirebaseChatApp: App {
    
    init() {
        if let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist"),
           let options = FirebaseOptions(contentsOfFile: filePath) {
            options.databaseURL = "https://millionairequiz-d3541-default-rtdb.firebaseio.com"
            FirebaseApp.configure(options: options)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ChatView(chatID: "test_chat_ID")
        }
    }
}
