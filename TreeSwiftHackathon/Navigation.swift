import SwiftUI

struct Navigation: View {
    
    @State private var selectedTabindex = 0
    @StateObject var viewModel = GasStationViewModel()
    @StateObject var locationManager = LocationManager()


    var body: some View {
        TabView {
            FriendsView().tabItem {Label("Social", systemImage: "person")}
            ForestView().tabItem{Label("Mi Parque", systemImage: "house")}.background(Color(hex: "#87AFEC"))
            ActividadView().tabItem{
                Label("Actividad", systemImage: "square.and.arrow.up")
            }
        }.onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(Color(hex: "#1C1C1E"))
        }.tint(.white).onAppear {
            viewModel.findAllNearbyGasStations()
        }.onChange(of: viewModel.gasStations) { newValue in
        // Start monitoring the first gas station
        if let firstStation = newValue.first {
            print(newValue.first)
            locationManager.monitorRegionAtLocation(
                center: firstStation.placemark.coordinate,
                identifier: firstStation.placemark.name ?? "Unknown"
            )
        }
    }
    .onChange(of: locationManager.enteredRegion) { entered in
        if entered {
            // The user entered the region
            print("Entered the region")
        } else {
            // The user left the region
            print("Exited the region")
        }
    }
        
    }
    
}

#Preview {
    Navigation()
}
