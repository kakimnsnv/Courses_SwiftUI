import Foundation


struct QuizOption: Codable {
    let correct: Bool
    let value: String
    let detail: String?
}

struct QuizQuestion: Codable, Identifiable{
    let text: String
    let options: [QuizOption]
    
    var id: String {
        return UUID().uuidString
    }
}

struct Quiz: Codable, Identifiable{
    let id: String
    let title: String
    let topic: String
    let questions: [QuizQuestion]
    let description: String
}

struct QuizInTopic: Codable, Identifiable{
    let id: String
    let title: String
    let description: String
}

struct Topic: Codable, Identifiable{
    let id: String
    let img: String
    let title: String
    let quizzes: [QuizInTopic]
}
