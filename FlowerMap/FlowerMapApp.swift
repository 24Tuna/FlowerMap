//
//  FlowerMapApp.swift
//  FlowerMap
//
//  Created by cmStudent on 2021/07/19.
//

import SwiftUI
import Firebase

@main
struct FlowerMapApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            //MainView()
//            PostManagerView()
            PostView(isPost: Binding.constant(true))
        }
    }
}
