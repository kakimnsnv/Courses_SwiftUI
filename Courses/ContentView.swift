import SwiftUI

struct ContentView: View {
    let (topics, quizzes) = parseTopicsAndQuizzesFromYAMLFilesInFolders() ?? ([], [])
    
    var body: some View {
        TopicListView(topics: topics, quizzes: quizzes)
    }
}

#Preview {
    ContentView()
}
