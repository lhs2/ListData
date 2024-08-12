//
//  PopulateListModel.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import Foundation

enum ApiError: String, Error {
    case genericError
    case parseError
}

struct ApiResponse: Codable {
    var data: [Population]
}

struct Population: Codable, Hashable{
    var State: String?
    var Population: Int?
    
    func getCellLabel() -> String {
        let populationValue = (Population != nil) ? "\(Population ?? 0)" : "NO INFO"
        return "\(State ?? ""): \(populationValue)"
    }
}
