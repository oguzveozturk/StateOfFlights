//
//  FlightsMapController.swift
//  FlightsMap
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import UIKit
import MapKit
import struct FlightAPI.Coordinates
import Common
import CommonViews
import CounrtySelector

public class FlightsMapController: UIViewController {
    
    var presenter:FlightsMapPresenterProtocol!
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.frame = view.bounds
        map.registerDefault(type: ArtworkMarkerView.self)
        map.delegate = self
        return map
    }()
    
    private lazy var indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        navigationItem.setRightBarButton(UIBarButtonItem(customView: indicator), animated: true)
        presenter.load()
    }
}

extension FlightsMapController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        presenter.regionChange(.init(coordinates: mapView.coordinates))
    }
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Plane,
           let dequeuedView = mapView.defaultReusableAnnotation(with: ArtworkMarkerView.self) {
            dequeuedView.annotation = annotation
            return dequeuedView
        }
        return nil
    }
}

extension FlightsMapController: FlightsMapViewProtocol {
    func setInitialRegion() {
        mapView.region = .cities.istanbul.region
    }
    
    func showIndicator() {
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        indicator.stopAnimating()
    }
    
    func insertPlanes(annotations: [Plane]) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }
    
    func presentAlert(text: String) {
        let alert = UIAlertController(title: text, message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.presentedViewController?.present(alert, animated: true)
        }
    }
}
