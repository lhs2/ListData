//
//  PopulationListWorker.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import SwiftUI

public class PopulationAPI {
    func getData(completion: @escaping (Result<[Population], Error>) -> ()) {
        guard let url = URL(string: "https://datausa.io/api/data?drilldowns=State&measures=Population&year=latest") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error { completion(.failure(ApiError.genericError))}
            guard let data = data else { return }
            do {
                let populationList = try JSONDecoder().decode(ApiResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(populationList.data))
                }
            } catch {
                completion(.failure(ApiError.parseError))
            }
           
        }.resume()
    }
}
    
    
