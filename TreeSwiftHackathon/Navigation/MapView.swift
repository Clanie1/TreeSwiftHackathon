//
//  ContentView.swift
//  HelloWorldMapKit
//
//  Created by Daniel Barocio Valdez on 11/04/24.
//

import SwiftUI
import MapKit
import Observation




@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    let manager: CLLocationManager = CLLocationManager()
    var region: MKCoordinateRegion = MKCoordinateRegion()
    
    override init() {
        super.init()
        
        self.manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            manager.requestLocation()
        case .denied:
            print("Denied location")
        case .restricted:
            print("Restricted location")
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude,
                                                                       longitude: $0.coordinate.longitude ),
                                        span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        
    }
    
}

extension CLLocationCoordinate2D {
    
    static var tecMty: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 25.65186,
                               longitude: -100.28942)
    }
    
    static var unach: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 14.89521,
                               longitude: -92.27269)
    }
    
    static var cetys: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: 32.50624418,
                               longitude: -116.92404891)
    }
    
}

struct MapView: View {
    
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var locationManager = LocationManager.shared
    @State private var mapItems: [MKMapItem] = []
    @State private var isSearching = false
    
    func performSearch(search: String, region: MKCoordinateRegion?) async throws -> [MKMapItem] {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        request.resultTypes = .pointOfInterest
        
        guard let region = region else { return [] }
        
        request.region = region
        let search = MKLocalSearch(request: request)
        let response = try await search.start()
        
        return response.mapItems
        
    }
    
    func search() async {
        
        do {
            mapItems = try await performSearch(search: "Gas Station", region: locationManager.region)
            print(mapItems)
            isSearching = false
        } catch {
            mapItems = []
            isSearching = false
        }
        
    }
    
    var body: some View {
        
        ZStack {
            
            
            Map(position: $position) {
                
                UserAnnotation()
                ForEach(mapItems, id: \.self){
                    mapItem in Marker(item: mapItem)
                }
                
                Marker("UNACH iOS Lab", coordinate: .unach)
                
                Marker("CETYS iOS Lab", coordinate: .cetys)
                
                Annotation("Tec iOS Lab", coordinate: .tecMty) {
                    Image(systemName: "studentdesk")
                        .padding(15)
                        .foregroundStyle(.blue)
                        .background(.white)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
            }
            .task(id: isSearching) {
                if isSearching {
                    await search()
                } else {
                    
                }
            }
            .mapStyle(.standard)
            .onChange(of: locationManager.region) {
                withAnimation {
                    position = .region(locationManager.region)
                }
            }
            
            VStack {
                
                Spacer()
                HStack {
                    
                    Button("Search") {
                        isSearching = true
                    }.buttonStyle(.borderedProminent)
                    
                    
                    Button("Tec") {
                        withAnimation {
                            position = .region(.regionTec)
                        }
                    }.buttonStyle(.borderedProminent)
                    
                }
                
            }
            
        }
    }
}

extension MKCoordinateRegion: Equatable {
    public static func == (lhs: MKCoordinateRegion, rhs: MKCoordinateRegion) -> Bool {
        if lhs.center.latitude == rhs.center.latitude && lhs.span.latitudeDelta == rhs.span.latitudeDelta && lhs.span.longitudeDelta == rhs.span.longitudeDelta {
            return true
        } else {
            return false
        }
    }
    
    static var regionTec = MKCoordinateRegion(center: .tecMty, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    static var regionUNACH = MKCoordinateRegion(center: .unach, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    static var regionCETYS = MKCoordinateRegion(center: .cetys, span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    
}

#Preview {
    ContentView()
}
