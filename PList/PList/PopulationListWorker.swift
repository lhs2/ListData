//
//  PopulationListWorker.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import SwiftUI

struct ApiResponse: Codable {
    var data: [Population]
}

struct Population: Codable, Hashable{
    var State: String?
    var Population: Int?
    
    func getCellLabel() -> String {
        let populationValue = (Population != nil) ? "\(String(describing: Population))" : "NO INFO"
        return "\(State ?? ""): \(populationValue)"
    }
}

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
    
    
