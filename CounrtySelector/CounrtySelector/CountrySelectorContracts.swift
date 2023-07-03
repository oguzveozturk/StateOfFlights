//
//  CountrySelectorContracts.swift
//  CounrtySelector
//
//  Created by Oğuz Öztürk on 10.06.2023.
//

import Foundation
import Common

// MARK: - Presenter

public protocol CountrySelectorPresenterProtocol: AnyObject, CountriesDidLoadDelegate {
    /// Filtered countries based origins of flights.
    var countries: [Country] { get set }
    
    /// selectedCountry is used instead of selectedIndex, because selectedCountry
    /// can be added or removed from the array as the user drags the map.
    var selectedCountry: Country? { get set }
    
    /// Communicate between CountrySelectorPresenterProtocol --> FligtsMapPresenter
    var delegate: CounrtySelectorDelegate? { get set }
    
    /// Loads presenter's crucial functions
    func load()
    
    /// Gives to country from main Countries array at that index
    /// - Parameter at: Index of Country
    /// - Returns: Selected origin country
    func country(_ at: Int) -> Country
    
    /// All filters and selected states starts with this function
    /// - Parameter country: Selected origin country
    func assign(country: Country)
}

public protocol CounrtySelectorDelegate: AnyObject {
    /// Sends the CountrySelectorPresenter itself for delegation
    /// - Parameter presenter: CountrySelectorPresenterProtocol
    func didAssignDelegate(countrySelector presenter: CountrySelectorPresenterProtocol)
    
    /// Sends selected country to the delegate
    /// - Parameter country: Country that selected by user
    func didSelect(country: Country?)
}

public protocol CountriesDidLoadDelegate: AnyObject {
    /// Sends the loaded countries from server
    /// - Parameter countries: Filtered countries based origins of flights.
    func countriesDidLoad(countries: [Country])
}

// MARK: - View

protocol CountrySelectorViewProtocol: AnyObject {
    /// Refreshes the tableview.
    func reloadData()
    
    /// Sets title for navigationBar
    /// - Parameter text: Title of navigationBar
    func setTitle(_ text: String)
    
    /// Adds accessoryView to tableView's tapped cell
    /// - Parameter at: Index of tapped cell
    func addCheckmark(_ at:Int)
    
    /// Removes accessoryView from tableView
    /// - Parameter at: Index of  cell to be not selected
    func removeCheckmark(_ at:Int)
}
