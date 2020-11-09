//
//  ContentView.swift
//  Estimator
//
//  Created by salvatore dessena on 25/10/2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var valoreDiMercato: StartValue
    
    //var campi immobile
    @State private var houseAddress: String = ""
    @State private var houseTown: String = ""
    @State private var houseRegion: String = ""
    //var campi proprietario
    
    @State private var ownerName: String = ""
    @State private var ownerSurname: String = ""
    @State private var ownerAddress: String = ""
    @State private var ownerCity: String = ""
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Estimator é l'unica App per la stima degli immobili . Inserisci i dati e assegna i coefficienti: otterrai immediatamente il valore.").foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            Spacer()
                
                //dati con textfield: upgradare con database
                Form {
                    Section(header: Text("Dati dell'immobile")) {
                        HStack {
                            Text("Via:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $houseAddress)
                        }
                        
                        HStack {
                            Text("Comune:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $houseTown)
                        }
                        HStack {
                            Text("Provincia:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $houseRegion)
                        }
                        
                    }.padding(10)
                    
                    Section(header: Text("Dati del proprietario")) {
                        HStack {
                            Text("Nome:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $ownerName)
                        }
                        HStack {
                            Text("Cognome:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $ownerSurname)
                        }
                        HStack {
                            Text("Via:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $ownerAddress)
                        }
                        HStack {
                            Text("Comune:").bold().foregroundColor(.gray)
                            TextField("Type here...", text: $ownerCity)
                        }
                    }.padding(10)
                }
                NavigationLink("Inizia", destination: StartValueView(valoreDiMercato: StartValue()))
                    .padding()
                    .font(.title)
                    
            }.navigationBarTitle("Estimator", displayMode: .automatic)
        }
     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(valoreDiMercato: StartValue())
    }
}
