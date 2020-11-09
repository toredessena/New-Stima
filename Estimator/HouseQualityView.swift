//
//  HouseQualityView.swift
//  Estimator
//
//  Created by salvatore dessena on 25/10/2020.
//

import SwiftUI

struct HouseQualityView: View {
    var body: some View {
        VStack {
        Text("Accessibilità")
        Text("Fruibilità")
        Text("Classe energetica")
        }.navigationBarTitle("Qualità", displayMode: .automatic)
    }
}

struct HouseQualityView_Previews: PreviewProvider {
    static var previews: some View {
        HouseQualityView()
    }
}
