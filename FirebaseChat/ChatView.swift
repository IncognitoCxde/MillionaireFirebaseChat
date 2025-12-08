import SwiftUI

struct ChatView: View {
    
    @ObservedObject private var viewModel: ChatViewModel
    @State private var messageText: String = ""

    init(chatID: String) {
        self.viewModel = ChatViewModel(chatID: chatID)
    }

    var body: some View {
        VStack {
            List(viewModel.messages, id: \.message) { message in
                HStack {
                    if message.isSent {
                        Spacer()
                        Text(message.message)
                            .padding(10)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 5)
                    } else {
                        Text(message.message)
                            .padding(10)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.bottom, 5)
                        Spacer()
                    }
                }
            }

            HStack {
                TextField("Type your message...", text: $viewModel.chatText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)

                Button(action: {
                    viewModel.handleSend()
                }) {
                    Text("Send")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.loadMessages()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(chatID: "test_chat_ID")
    }
}
