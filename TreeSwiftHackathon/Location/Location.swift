import SwiftUI
import MapKit
import CoreLocation

struct GasStation: Identifiable, Equatable {
    let id = UUID()
    let placemark: MKPlacemark
}

class GasStationViewModel: ObservableObject {
    @Published var gasStations: [GasStation] = []
    
    func findAllNearbyGasStations() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Gas Station"
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            self.gasStations = response.mapItems.map { GasStation(placemark: $0.placemark) }
            print(self.gasStations)
        }
    }
    
    
}



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var enteredRegion = false

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func monitorRegionAtLocation(center: CLLocationCoordinate2D, identifier: String ) {
        if CLLocationManager.isMonitoringAvailable(for: CLCircularRegion.self) {
            let region = CLCircularRegion(center: center,
                                          radius: 100.0,
                                          identifier: identifier)
            locationManager.startMonitoring(for: region)
        }
    }

    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if region is CLCircularRegion {
            self.enteredRegion = true
            // Trigger your action here
        }
    }

    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        if region is CLCircularRegion {
            self.enteredRegion = false
        }
    }
}
