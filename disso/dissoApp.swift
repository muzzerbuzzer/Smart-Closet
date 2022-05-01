//
//  dissoApp.swift
//  disso
//
//  Created by Nika Pakravan on 12/03/2022.
//

import SwiftUI
import Firebase

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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                switch sessionService.state {
                case .loggedIn:
                    ContentView()
                        .environmentObject(sessionService)
                        .environmentObject(clothesViewModel)
                        .environmentObject(outfitsViewModel)
                case .loggedOut:
                    LoginView()
                }
            }
        }
    }
}



