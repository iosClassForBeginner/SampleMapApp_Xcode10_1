//
//  ViewController.swift
//  SampleMapApp_Xcode10_1
//
//  Created by Muneharu Onoue on 2019/02/20.
//  Copyright © 2019年 Muneharu Onoue. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let address = "大阪府大阪市浪速区日本橋４丁目４−５−１５"
        CLGeocoder().geocodeAddressString(address) { [weak mapView] placemarks, error in
            guard let loc = placemarks?.first?.location?.coordinate else {
                return
            }
            print("緯度 : \(loc.latitude)")
            print("経度 : \(loc.longitude)")
            
            // 地図の中心の緯度・軽度を設定
            mapView?.setCenter(loc ,animated:true)
            
            // 縮尺を設定
            let region = MKCoordinateRegion(center: loc,
                                            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            mapView?.setRegion(region,animated:true)
            
            // マップにピンを刺す
            let annotation = MKPointAnnotation()
            annotation.coordinate = loc
            mapView?.addAnnotation(annotation)
        }
        
        // マップ表示形式
        mapView.mapType = MKMapType.standard
        // mapView.mapType = MKMapType.hybrid
        // mapView.mapType = MKMapType.satellite
    }
    
    
}
