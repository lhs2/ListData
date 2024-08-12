//
//  PopulationListViewModel.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import Foundation

final class PopulationListViewModel: ObservableObject {
    @Published var populationList = [Population]()
    
    func getData() {
        PopulationAPI().getData() { populationList in
            self.populationList = populationList
        }
    }
}
