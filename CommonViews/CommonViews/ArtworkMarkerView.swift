//
//  ArtworkMarkerView.swift
//  CommonViews
//
//  Created by Oğuz Öztürk on 9.06.2023.
//

import Foundation
import MapKit
import Common

public class ArtworkMarkerView: MKMarkerAnnotationView {
    public override var annotation: MKAnnotation? {
        willSet {
            guard let plane = newValue as? Plane else { return}
            markerTintColor = .icao24ToColor(plane.icao24)
            glyphImage = UIImage(systemName: "airplane")
        }
    }
}
