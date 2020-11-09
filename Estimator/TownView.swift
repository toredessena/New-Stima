//
//  TownView.swift
//  Estimator
//
//  Created by salvatore dessena on 25/10/2020.
//

import SwiftUI

import SwiftUI

struct TownView: View {
    
    @State private var townTestValue: Double = 100000.00
    
    @State private var cursorTown = 1
    @State private var cursorUbic = 1
    @State private var cursorExpo = 1
    
    
    let percentTown = [-20.00, 0.00, 20.00]
    let percentUbic = [-10.00, 0.00, 10.00]
    let percentExpo = [-5.00, 0.00, 5]
    

    
    
    var calcoloTown: Double {
        let selectTown = Double(percentTown[cursorTown])
        let incertTown = Double(townTestValue)
        let valueTown = incertTown / 100 * selectTown
        
        let r = valueTown
        return r
    }
    
    var calcoloUbic: Double {
        let selectUbic = Double(percentUbic[cursorUbic])
        let incertUbic = Double(townTestValue)
        let valueUbic = incertUbic / 100 * selectUbic
        
        let w = valueUbic
        return w
    }
    
    var calcoloExpo: Double {
        let selectExpo = Double(percentExpo[cursorExpo])
        let incertExpo = Double(townTestValue)
        let valueExpo = incertExpo / 100 * selectExpo
        
        let z = valueExpo
        return z
    }
    
    
    var finalCalcTown: Double {
        let sumCalcTown = calcoloTown + calcoloUbic + calcoloExpo
        let finalSum = sumCalcTown + townTestValue
        
        return finalSum
    }
    
    
    var body: some View {
        
    VStack {
        
        Text("Il valore di posizione è il risultato dell'inserimento dell'immobile nel contesto e si compone di 3 parametri. Inserisci i valori corrispondenti").foregroundColor(.gray).padding()
        
        Spacer()
            
        Form {

            Section (header: Text("Tipologia Centro urbano")) {
                HStack {
                    Text("Qualità")
                    Spacer()
                    Text("Nome Livello")
                }
                Picker("1", selection: $cursorTown) {
                    ForEach(0..<percentTown.count) { index in
                        Text("\(self.percentTown[index], specifier: "%g") %").tag(index)
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                HStack {
                    Text("Incremento - Riduzione:").foregroundColor(.gray)
                    Spacer()
                    Text("€ \(calcoloTown, specifier: "%g")").bold()
                }
              
                
                
        }
            
            Section (header: Text("Ubicazione")) {
                
                HStack {
                    Text("Qualità")
                    Spacer()
                    Text("Nome Livello")
                }
                
                Picker("2", selection: $cursorUbic) {
                    ForEach(0..<percentUbic.count) { index in
                        Text("\(self.percentUbic[index], specifier: "%g") %").tag(index)
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                HStack {
                    Text("Incremento - Riduzione:").foregroundColor(.gray)
                    Spacer()
                    Text("€\(calcoloUbic, specifier: "%g")").bold()
                }
               
                
                
        }
            
            Section (header: Text("Esposizione")) {
                
                
                HStack {
                    Text("Qualità")
                    Spacer()
                    Text("Nome Livello")
                }
                
                Picker("3", selection: $cursorExpo) {
                    ForEach(0..<percentExpo.count) { index in
                        Text("\(self.percentExpo[index], specifier: "%g") %").tag(index)
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text("Incremento - Riduzione:").foregroundColor(.gray)
                    Spacer()
                    Text("€ \(calcoloExpo, specifier: "%g")").bold()
                }
              
            }
            
            HStack {
                Text ("La somma è:")
                    Spacer()
                Text("€ \(finalCalcTown, specifier: "%g")").bold()
            }.padding()
        }
            
        NavigationLink("Avanti", destination: HouseQualityView())
            .foregroundColor(.blue)
            .font(.title2)
           
        } .navigationBarTitle("Valore di Posizione", displayMode: .automatic)
     
    }
 }

struct TownView_Previews: PreviewProvider {
    static var previews: some View {
        TownView()
    }
}

