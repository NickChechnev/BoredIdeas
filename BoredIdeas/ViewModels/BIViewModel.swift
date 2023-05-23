//
//  RandomIdeaViewModel.swift
//  BoredIdeas
//
//  Created by Никита Чечнев on 22.05.2023.
//

import Foundation

final class BIViewModel {
    
    lazy var randomIdea: String = ""
    lazy var generatedIdea: String = ""
    
    fileprivate enum APIConstants {
        static let baseURL = "https://www.boredapi.com/api/activity"
    }
    
    func generateRandomIdea() {
        BIDataManager.shared.fetch(APIConstants.baseURL, expecting: Activity.self) { [weak self] result in
            switch result {
            case .success(let success):
                self?.randomIdea = success.activity
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
    
    func buildAnIdea(_ type: String, _ participants: Int) {
        let urlString = APIConstants.baseURL + "?" + "type=\(type)" + "&" + "participants=\(participants)"
        BIDataManager.shared.fetch(urlString, expecting: Activity.self) { [weak self] result in
            switch result {
            case .success(let success):
                self?.generatedIdea = success.activity
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
