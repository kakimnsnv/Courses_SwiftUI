import SwiftUI

struct TopicDetailView: View {
    let topic: Topic
    let quizzes: [Quiz]

    var body: some View {
        List(topic.quizzes) { quiz in
            NavigationLink(destination: QuizView(quiz: quizzes.first {$0.id == quiz.id}!)) {
                VStack(alignment: .leading){
                    Text(quiz.title)
                        .font(.title2)
                    Text(quiz.description)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationBarTitle(topic.title)
    }
}

#Preview {
    TopicDetailView(topic: Topic(id: "12", img: "image", title: "title", quizzes: [QuizInTopic(id: "id", title: "titlee", description: "decription")]), quizzes: [Quiz(id: "id", title: "title", topic: "topc", questions: [QuizQuestion(text: "text", options: [QuizOption(correct: true, value: "fss", detail: "fsaf")])], description: "fdsfds")])
}
