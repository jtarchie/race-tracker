//
//  MapView.swift
//  pacer
//
//  Created by JT Archie on 10/25/14.
//  Copyright (c) 2014 Geeky Of Us, LLC. All rights reserved.
//

import Foundation
import MapKit

class MapView: MKMapView, MKMapViewDelegate {
    var marathon: MarathonCoordinates = MarathonCoordinates()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.setRegion(self.marathon.region(), animated: true)
        self.addOverlay(self.marathon.polyline())
        //self.addOverlay(MKCircle(centerCoordinate: self.marathon.coordinateFromDistance(12 * 1600), radius: 3))
    }
    
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer! {
        if overlay is MKCircle {
            var circle = MKCircleRenderer(overlay: overlay)
            circle.strokeColor = UIColor.blackColor()
            circle.fillColor = UIColor.blueColor()
            circle.lineWidth = 5
            return circle
        } else {
            var line = MKPolylineRenderer(overlay: overlay)
            line.strokeColor = UIColor.redColor()
            line.lineWidth = 5
            return line
        }
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}