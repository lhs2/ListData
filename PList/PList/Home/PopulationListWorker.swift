//
//  PopulationListWorker.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import SwiftUI

public class PopulationAPI {
    func getData(completion: @escaping ([Population]) -> ()) {
        guard let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            let populationList = try? JSONDecoder().decode(ApiResponse.self, from: data)
            guard let populationList = populationList else { return }
            DispatchQueue.main.async {
                completion(populationList.data)
            }
        }.resume()
    }
}
    
    
