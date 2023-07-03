//
//  CountrySelectorBuilder.swift
//  CounrtySelector
//
//  Created by Oğuz Öztürk on 10.06.2023.
//

import Foundation
import UIKit
import Common
public final class CountrySelectorBuilder {
    
    public static func make(delegate: CounrtySelectorDelegate) -> UINavigationController {
        let view = CountrySelectorController()
        let presenter = CountrySelectorPresenter(view: view, delegate: delegate)
        view.presenter = presenter
        let nav = UINavigationController(rootViewController: view)
        nav.isModalInPresentation = true
        if let sheet = nav.sheetPresentationController {
            let fraction = UISheetPresentationController.Detent.custom { _ in 75 }
            sheet.detents = [fraction,.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
        }
        return nav
    }
}
