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
        NavigationView {
            List {
                ForEach(viewModel.populationList, id: \.self) { item in
                    Text(item.getCellLabel())
                }
            }
        }.task {
            viewModel.getData()
        }
    }
}

#Preview {
    ContentView()
}
