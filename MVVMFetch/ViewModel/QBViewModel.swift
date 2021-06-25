//
//  EmployeesViewModel.swift
//  MVVMFetch
//
//  Created by Rodrigo Machado on 04/09/20.
//  Copyright © 2020 Rodrigo Machado. All rights reserved.
//

import Foundation
import UIKit

enum QBViewModelState {
    case loading(Bool)
    case data
    case failure(Bool)
}

class QBViewModel {

    private var apiService: APIServiceProtocol?
    private var qbData: [QBData]?
    var numberOfRows: Int? { return qbData?.count }
    var state: Bindable<QBViewModelState?> = Bindable(nil)
    
    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
    }

    func getQBName(at indexPath: IndexPath) -> String? {
        return qbData?[indexPath.row].name
    }
    
    func getQBTeam(at indexPath: IndexPath) -> String? {
        return qbData?[indexPath.row].team
    }
    
    func fetchData() {
        state.value = .loading(true)
        apiService?.apiGetQBData { [weak self] (data, error)  in
            if error != nil {
                self?.state.value = .loading(false)
                self?.state.value = .failure(true)
            } else {
                self?.qbData = data
                self?.state.value = .loading(false)
                self?.state.value = .data
            }
        }
    }
}
