//
//  ContentView.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var populationList = [Population]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(populationList, id: \.self) { item in
                    Text(item.getCellLabel())
                }
            }
        }.task {
            PopulationAPI().getData() { populationList in
                self.populationList = populationList
            }
        }
    }
}

#Preview {
    ContentView()
}
