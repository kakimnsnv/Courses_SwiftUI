import SwiftUI


struct TopicListView: View {
    var topics: [Topic]
    var quizzes: [Quiz]

    let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(topics) { topic in
                        NavigationLink(destination: TopicDetailView(topic: topic, quizzes: quizzes)) {
                            VStack {
                                if let topicImage = UIImage(named: topic.img) {
                                    Image(uiImage: topicImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                }
                                Text(topic.title)
                                    .font(.headline)
                                    .multilineTextAlignment(.center)
                                    .padding()
                            }
                            .background(Color.secondary.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Topics")
        }
    }
}


#Preview {
    TopicListView(topics: [Topic(id: "topic", img: "ts.png", title: "topicTitle", quizzes: [QuizInTopic(id: "quiz", title: "quiz", description: "quiz")])], quizzes: [Quiz(id: "quiz", title: "quiz", topic: "topic", questions: [QuizQuestion(text: "text", options: [QuizOption(correct: true, value: "val", detail: "det")])], description: "des")])
}
