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
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView() 
            }
        }
    }
}

/*@main
struct dissoApp: App {
    @StateObject var clothesViewModel = ClothesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(clothesViewModel)
        }
    }
}*/


