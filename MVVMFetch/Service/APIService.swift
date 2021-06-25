//
//  APIService.swift
//  MVVMFetch
//
//  Created by Rodrigo Machado on 04/09/20.
//  Copyright © 2020 Rodrigo Machado. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func apiGetQBData(completion: @escaping ([QBData]?, NSError?) -> ())
}

class APIService {
    private let url = URL(string: "http://localhost:3000/qb/list")!
}

extension APIService: APIServiceProtocol {
    func apiGetQBData(completion: @escaping ([QBData]?, NSError?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error as NSError)
            } else {
                guard let data = data else { return }
                do {
                    guard let qbData = try? JSONDecoder().decode(QB.self, from: data) else { return }
                    completion(qbData.data, nil)
                }
            }
        }.resume()
    }
}
