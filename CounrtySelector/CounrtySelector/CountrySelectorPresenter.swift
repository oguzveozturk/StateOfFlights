//
//  CountrySelectorPresenter.swift
//  CounrtySelector
//
//  Created by Oğuz Öztürk on 10.06.2023.
//

import Foundation
import Common

final class CountrySelectorPresenter:NSObject, CountrySelectorPresenterProtocol {
    
    weak var delegate: CounrtySelectorDelegate?

    var countries = [Country]()
    var selectedCountry: Country?
    private let view:CountrySelectorViewProtocol!
    
    init(view:CountrySelectorViewProtocol!,
         delegate:CounrtySelectorDelegate) {
        self.view = view
        self.delegate = delegate
        super.init()
    }
    
    func load() {
        view.setTitle("Select Country")
        delegate?.didAssignDelegate(countrySelector: self)
    }
    
    func assign(country: Country) {
        country == selectedCountry ? deselect(country) : select(country)
    }
    
    func select(_ country: Country) {
        removeCheckmark(for: selectedCountry)
        addCheckmark(for: country)
        selectedCountry = country
        delegate?.didSelect(country: country)
    }
    
    func deselect(_ country: Country) {
        removeCheckmark(for: selectedCountry)
        selectedCountry = nil
        delegate?.didSelect(country: nil)
    }
    
    func addCheckmark(for country: Country) {
        if let indexOf = countries.firstIndex(of: country) {
            view.addCheckmark(indexOf)
        }
    }
    
    func removeCheckmark(for country: Country?) {
        if let country = country,
           let indexOf = countries.firstIndex(of: country) {
            view.removeCheckmark(indexOf)
        }
    }
    
    func country(_ at: Int) -> Common.Country {
        countries[at]
    }
}

extension CountrySelectorPresenter:CountriesDidLoadDelegate {
    func countriesDidLoad(countries: [Common.Country]) {
        self.countries = countries
        view.reloadData()
    }
}
