//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Sonun on 22/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    var characters: [Result] = []
    var networkManager = NetworkManager()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.backgroundColor = .systemCyan
        table.translatesAutoresizingMaskIntoConstraints  = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubViews()
        showData()
    }
    
    private func showData() {
        networkManager.getdata { result in
                DispatchQueue.main.async {
                self.characters = result
                self.tableView.reloadData()
            }
        }
    }
    
    private func setUpSubViews() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let model = characters[indexPath.row]
        cell.setData(data: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

