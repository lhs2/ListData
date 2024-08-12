//
//  LoadingState.swift
//  PList
//
//  Created by Luiz Henrique on 12/08/2024.
//

import Foundation

enum LoadingState {
    case failure(Error)
    case loading
    case loaded
}
