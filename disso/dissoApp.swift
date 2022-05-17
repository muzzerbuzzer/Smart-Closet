//
//  dissoApp.swift
//  disso
//
//  Created by Nika Pakravan on 12/03/2022.
//

//information for the entire app
import SwiftUI
import Firebase

//setting up Firebase. straight from the website
final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct dissoApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var sessionService = SessionServiceImpl()
    @StateObject var clothesViewModel = ClothesViewModel()
    @StateObject var outfitsViewModel = OutfitsViewModel()
    @StateObject var calendarViewModel = CalendarViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                //session service - which environment objects to show if they are logged in or out
                switch sessionService.state {
                case .loggedIn:
                    ContentView()
                        .environmentObject(sessionService)
                        .environmentObject(clothesViewModel)
                        .environmentObject(outfitsViewModel)
                        .environmentObject(calendarViewModel)
                    
                case .loggedOut:
                    LoginView()
                }
            }
        }
    }
}



