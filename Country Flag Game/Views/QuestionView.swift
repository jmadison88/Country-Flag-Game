//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Josh Madison on 1/12/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager: QuizManager
    var body: some View {
        if quizManager.playingGame {
            VStack(spacing: 20) {
                HStack {
                    ProgressBar(progress: quizManager.progress)
                    Text("Which country's flag is this")
                        .font(.title)
                    Image(quizManager.country)
                        .resizable()
                        .frame(width: 300, height: 200)
                    ForEach(quizManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                            .environmentObject(quizManager)
                    }
                }
                Button {
                    quizManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background: quizManager.answerSelected ? .yellow: .gray)
                }
                .disabled(!quizManager.answerSelected)
                Spacer()
                Text("Country Flag Quiz")
                    .foregroundColor(.yellow)
                    .font(.title)
                    .fontWeight(.heavy)
                Spacer()
                Text("\(quizManager.index) out of \(quizManager.questions.count)")
                    .foregroundColor(.yellow)
                    .fontWeight(.heavy)
            }
            .padding()
            .frame(width: .infinity, height: .infinity)
            .background(.cyan)
        }
        else {
            VStack(spacing: 20) {
                Text("Country Flag Quiz")
                    .font(.title)
                Text("Congratuations! You have completed the quiz.")
                Text("You scored \(quizManager.score) out of \(quizManager.questions.count)")
                Button {
                    quizManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            }
            .foregroundColor(.yellow)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.cyan)
        }
    }
}
struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}
