//
//  VcView.swift
//  Estimator
//
//  Created by salvatore dessena on 27/10/2020.
//

import SwiftUI

struct VcView: View {
    
    var valorePartenza: Double
    //Source of Truth
    @ObservedObject var valoreDiMercato: StartValue
    
   
  
    
    var body: some View {
        
     
            VStack {
            Text("Seleziona il livello qualitativo dei componenti edilizi: otterrai automaticamente i coefficienti migliorativi o peggiorativi e il valore di conservazione finale").foregroundColor(.gray)
            
            Spacer()
            
            Form {
               Section(header: Text("Strutture")) {
                    HStack {
                          Text("Livello selezionato:").foregroundColor(.gray)
                          Spacer()
                        Text("\(valoreDiMercato.factorAndDefinitions[valoreDiMercato.structValue] ?? "Buono" )").bold()
                      }

                Slider(value: $valoreDiMercato.structValue, in: -0.20...0.20, step: 0.10)
                          .accentColor(.orange)
                      
                      HStack {
                          Text("Il valore di incremento è:").foregroundColor(.gray)
                          Spacer()
                        Text("\(valoreDiMercato.calcStruct(valorediPartenza: valorePartenza), specifier: "%g")").bold()
                      }
                      
                }
                
             
                
            }

            HStack {
                Text("Il valore VC è:")
                Spacer()
                Text("€ \(valoreDiMercato.calcStruct(valorediPartenza: valorePartenza))").bold()
            }.padding()
            
            NavigationLink("Avanti", destination: TownView())
                .padding()
                .font(.title2)
                .foregroundColor(.blue)
            
        }.navigationBarTitle("Valore di Conservazione")
        
    }
}

/*struct VcView_Previews: PreviewProvider {
    static var previews: some View {
        VcView(valoreFinale: Double.Type, valoreDiMercato: StartValue())
    }
}*/
