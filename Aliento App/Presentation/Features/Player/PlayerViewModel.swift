//
//  PlayerViewModel.swift
//  Aliento App
//
//  Created by Juan Armando Frías Ramírez on 11/07/23.
//

/* 
import Foundation
import Resolver

public class PlayerViewModel {
   @Injected var playerRepository : repo
    
    init() {}
    
    let locationsUiState = Box<[LocationsModelPresentation]>([])
    
    let loadingUiState = Box<Bool>(false)

    func getLocations() {
        loadingUiState.value = true
        locationsRepository.getLocations() { result in
            self.loadingUiState.value = false
            switch result {
            case.success(let locations):
                let locationsPresentation = locations.map { domainLocations in domainLocations.toPresentation() }
                self.locationsUiState.value = locationsPresentation
            case .failure(_):
                self.locationsUiState.value = []
            }
        }
    }
}
*/
