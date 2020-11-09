//
//  EstimatorApp.swift
//  Estimator
//
//  Created by salvatore dessena on 25/10/2020.
//

import SwiftUI

@main
struct EstimatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(valoreDiMercato: StartValue())
        }
    }
}
