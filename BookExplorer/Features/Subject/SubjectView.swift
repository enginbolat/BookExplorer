//
//  SubjectView.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct SubjectView: View {
    @EnvironmentObject private var coordinator: AppCoordinator
    @StateObject var viewModel = SubjectViewModel()
    var subject: String
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView("Loading...")
             case .loaded(let books):
                let subjectBooks: [SubjectSt] = books
                ScrollView {
                    LazyVStack {
                        ForEach(subjectBooks) { book in
                            BookCarHorizontal(
                                imageUrl: book.coverUrl,
                                onPress: {
                                    coordinator.push(page: .Detail(id: book.key!))
                                }
                            )
                        }
                    }
                }
            case .failed(let error):
                errorView(error)
            }
        }
        .onAppear {
            if case .idle = viewModel.state {
                viewModel.fetchSubject(subject)
            }
        }
        .navigationTitle(subject.uppercased())
    }


     @ViewBuilder
     private func errorView(_ error: Error) -> some View {
         VStack {
             Text("Error: \(error.localizedDescription)").foregroundColor(.red)
             Button("Retry") { viewModel.fetchSubject(subject) }
         }
     }
}




#Preview {
    SubjectView(subject: "Horror")
}
