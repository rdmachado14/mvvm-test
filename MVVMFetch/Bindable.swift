//
//  Bindable.swift
//  MVVMFetch
//
//  Created by Rodrigo Machado on 25/05/21.
//  Copyright © 2021 Rodrigo Machado. All rights reserved.
//

import Foundation

public class Bindable<T> {    
    var value: T? {
        didSet {
            listener.forEach { $0(value) }
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    private var listener: [((T?) -> Void)] = []
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener.append(listener)
    }
}
