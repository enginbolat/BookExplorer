//
//  DetailView.swift
//  Coordinator
//
//  Created by Engin Bolat on 18.09.2025.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var viewModel = DetailViewModel()
    var bookId: String
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .idle: EmptyView()
            case .loading: ProgressView("Loading...")
            case .loaded(let detail):
                 DetailBody(detail: detail)
            case .failed(let error):
                VStack {
                    Text("Error: \(error.localizedDescription)")
                    Button("Retry") { viewModel.fetchDetail(for: bookId)}
                }
            }
        }.onAppear {
            if case .idle = viewModel.state {
                viewModel.fetchDetail(for: bookId)
            }
        }
    }
}

#Preview {
    DetailView(bookId: "12")
}
