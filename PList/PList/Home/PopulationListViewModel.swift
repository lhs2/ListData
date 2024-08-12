//
//  PopulationListViewModel.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import Foundation

final class PopulationListViewModel: ObservableObject {
    @Published var populationList = [Population]()
    @Published var loadingState: LoadingState = .loading
    
    func getData() {
        PopulationAPI().getData() { response in
            switch response {
            case .success(let populationList):
                self.populationList = populationList
                self.loadingState = .loaded
            case .failure(let error):
                self.loadingState = LoadingState.failure(error)
            }
        }
    }
}
