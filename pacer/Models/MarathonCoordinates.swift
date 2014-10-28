//
//  Marathon.swift
//  pacer
//
//  Created by JT Archie on 10/25/14.
//  Copyright (c) 2014 Geeky Of Us, LLC. All rights reserved.
//

import Foundation
import MapKit

class MarathonCoordinates {
    init() {
        var path = NSBundle.mainBundle().pathForResource("NYC-2013", ofType: "csv")
        var lines: [String] = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)!.componentsSeparatedByString("\n")
        self.locations = lines.map{ (line: String) -> CLLocation in
            let coordinates: [NSString] = line.componentsSeparatedByString(",")
            return CLLocation(
                latitude: coordinates[0].doubleValue,
                longitude: coordinates[1].doubleValue
            )
        }
    }
    
    func polyline() -> MKPolyline {
        var coordinates = self.coordinates()
        return MKPolyline(coordinates: &coordinates, count: coordinates.count)
    }
    
    func region() -> MKCoordinateRegion {
        return MKCoordinateRegionForMapRect(self.polyline().boundingMapRect)
    }
    
    func coordinates() -> [CLLocationCoordinate2D] {
        return self.locations.map { $0.coordinate }
    }
    
    func coordinateFromDistance(distance: Double) -> CLLocationCoordinate2D {
        var total: CLLocationDistance = 0, prevLocation = self.locations[0]
        for location in self.locations {
            total += prevLocation.distanceFromLocation(location)
            if(total < distance) {
                prevLocation = location
            } else {
                return location.coordinate
            }
        }
        return self.locations[self.locations.count - 1].coordinate
    }
    
    var locations: [CLLocation]
        
}