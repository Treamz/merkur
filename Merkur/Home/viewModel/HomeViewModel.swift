//
//  HomeViewModel.swift
//  Merkur
//
//  Created by Ivan Chernoknizhikov on 04.12.2024.
//

import Foundation

class PlanetsViewModel: ObservableObject {
    
    @Published private var model: PlanetsModel = PlanetsModel()
    

    
    var nextIsAvailable: Bool  {
         model.nextIsAvailable
    }
    
    var previousIsAvailable: Bool {
        model.previousIsAvailable
    }

    var currentModel: Model {
        model.currentModel
        }
    
    func getNextModel() {
        model.currentModel = model.getNextModel()

    }
    
    func getPreviousModel() {
        model.currentModel = model.getPreviousModel()

    }
    
}

