//
//  ViewController.swift
//  Maps_temp
//
//  Created by Fausto Checa on 28/2/18.
//  Copyright © 2018 Fausto Checa. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var arrayPlace: [String] = []
    var arrayPlaces: [[String]] = []
    
    var annotations = [MKPointAnnotation]()
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
    }

    @IBAction func organizeAction(_ sender: Any) {
        
    }
    
    // OJO cambios de nombre...
    @IBAction func recogerDatos(_ sender: UIStoryboardSegue) {
        showMapa()
       
        
    }
    
    func showMapa (){
        // pintar en el mapa: geocode, hacer una region, anotar las coordenadas
        
        arrayPlaces.append(arrayPlace)
        
        let address = arrayPlace[0]
        let city = arrayPlace[1]
        
        let addressString = "\(address) \(city)"
        
        // geocode from array = friendly addresses > get placemarks
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if error != nil {
                print(error as Any)
                return
            }
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                // annotate placemarks
                let annotation = MKPointAnnotation()
                annotation.coordinate = (placemark.location?.coordinate)!
                
                
                if let street = placemark.thoroughfare {
                    if  let number = placemark.subThoroughfare {
                        let combStreetNum = "\(street), \(number)"
                        annotation.title = combStreetNum
                        annotation.subtitle = placemark.locality
                        
                        self.mapView.addAnnotation(annotation)
                        self.annotations.append(annotation)
                        
                        // region
                        let region = MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
                        
                        // draw map
                        self.mapView.setRegion(region, animated: true)
                        
                        // zoom across annotations
                        self.mapView.showAnnotations(self.annotations, animated: true)
                        
                    }
                }
            }
            
        }
        
    }
    
}

