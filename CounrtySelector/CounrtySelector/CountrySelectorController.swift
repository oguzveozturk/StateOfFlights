//
//  CountrySelectorController.swift
//  CounrtySelector
//
//  Created by Oğuz Öztürk on 10.06.2023.
//

import UIKit
import Common


public class CountrySelectorController: UITableViewController, CountrySelectorViewProtocol {
    var presenter:CountrySelectorPresenterProtocol!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        presenter.load()
    }
    
    func setTitle(_ text: String) {
        self.title = text
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func addCheckmark(_ at:Int) {
        tableView.cellForRow(at: IndexPath(row: at, section: 0))?.accessoryType = .checkmark
    }
    
    func removeCheckmark(_ at:Int) {
        tableView.cellForRow(at: IndexPath(row: at, section: 0))?.accessoryType = .none
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.countries.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let country = presenter.country(indexPath.row)
        cell.accessoryType = presenter.selectedCountry == country ? .checkmark : .none
        var content = cell.defaultContentConfiguration()
        content.text = country.title
        cell.contentConfiguration = content
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.assign(country: presenter.countries[indexPath.row])
    }
}
