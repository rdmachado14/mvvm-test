//
//  Employees.swift
//  MVVMFetch
//
//  Created by Rodrigo Machado on 04/09/20.
//  Copyright © 2020 Rodrigo Machado. All rights reserved.
//

struct QB: Codable {
    let data: [QBData]
}

struct QBData: Codable {
    let id: Int?
    let name: String?
    let team: String?
}
