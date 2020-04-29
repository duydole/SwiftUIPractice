//
//  MapView.swift
//  Demo SwiftUI 1
//
//  Created by Do Le Duy on 4/25/20.
//  Copyright © 2020 Do Le Duy. All rights reserved.
//

import SwiftUI
import MapKit

// UIViewRepresentable to use UIKit
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView:MKMapView, context: Context) {
        // Put the code to update UIKit view.
        let coordinate = CLLocationCoordinate2D(latitude: 34.0, longitude: -116.2)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
