//
//  ViewController.swift
//  MVVMFetch
//
//  Created by Rodrigo Machado on 04/09/20.
//  Copyright © 2020 Rodrigo Machado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var viewModel = QBViewModel()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.fetchData()
    }
    
    private func bindViewModel() {
        viewModel.state.bind { [weak self] in
            guard let state = $0 else { return }
            switch state {
            case .loading(_):
                // loading
                print("loading...")
            case .data:
                DispatchQueue.main.async { self?.tableView.reloadData() }
            case .failure(_):
                // failure
                print("failure...")
            case .none:
                break
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EmployeesTableViewCell
        
        cell?.nameLabel?.text = viewModel.getQBName(at: indexPath)
        cell?.ageLabel?.text = viewModel.getQBTeam(at: indexPath)
        
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? EmployeesTableViewCell
        
        print(cell?.nameLabel.text ?? "")
        print(cell?.ageLabel.text ?? "")
    }
}
