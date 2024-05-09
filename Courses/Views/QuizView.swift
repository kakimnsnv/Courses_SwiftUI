import SwiftUI

struct QuizView: View {
    let quiz: Quiz
    @State var isSelected: Bool = false

    var body: some View {
        List(quiz.questions) { question in
            VStack(alignment: .leading) {
                Text(question.text)
                    .font(.headline)
                ForEach(question.options, id: \.value) { option in
                    Button{
                        self.isSelected.toggle()
                    } label: {
                        Text(option.value)
                    }
                    .sheet(isPresented: $isSelected, content: {
                        BottomSheetView(option: option)
                    })
                    .padding()
                }
            }
        }
        .navigationBarTitle(quiz.title)
    }
}

struct BottomSheetView: View {
    let option: QuizOption
    
    var body: some View {
        VStack {
            Text(option.correct ? "You're right" : "Heh try again")
            Text(option.detail ?? "")
                .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding()
    }
}



#Preview {
    QuizView(quiz: Quiz(id: "id", title: "title", topic: "Topic", questions: [QuizQuestion(text: "question", options: [QuizOption(correct: true, value: "value", detail: "detail")])], description: "description"))
}
