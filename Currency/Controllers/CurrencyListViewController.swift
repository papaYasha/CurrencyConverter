//
//  CurrencyListViewController.swift
//  Currency
//
//  Created by Macbook on 15.02.22.
//

import UIKit

class CurrencyListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var currencyCode = ["USD", "EUR", "RUB", "BYN"]
    var flags = ["usa", "euro", "russia", "belarus"]
    var values: [Double] = []
    var converter = ConverterViewController()
    var cell = TableViewCell()

    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    private func config() {
        configTableView()
        title = "Currency list"
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: Constants.tableViewCellID, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: Constants.tableViewCellID)
    }
}

extension CurrencyListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyCode.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tableViewCellID, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        cell.codeLabel.text = currencyCode[indexPath.row]
        cell.flagImage.image = UIImage(named: flags[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
