//
//  ContentView.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PopulationListViewModel()
    
    var body: some View {
        switch viewModel.loadingState {
        case .failure(let error):
            Text("Error: " + error.localizedDescription)
        
        case .loading:
            Text("Loading informations")
                .onAppear {
                viewModel.getData()
            }
            ProgressView()
        case .loaded:
            NavigationView {
                List {
                    ForEach(viewModel.populationList, id: \.self) { item in
                        Text(item.getCellLabel())
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
