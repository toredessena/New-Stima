//
//  StartValueView.swift
//  Estimator
//
//  Created by salvatore dessena on 25/10/2020.
//

import SwiftUI

struct StartValueView: View {
    
    @ObservedObject var valoreDiMercato: StartValue
    
    
    
    var body: some View {
        
        VStack {
            Text("Inserisci qua le superfici e assegna il valore di mercato per le nuove costruzioni: otterrai il valore di partenza su cui applicare i coefficienti relativi allo stato del tuo immobile").foregroundColor(.gray)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            Spacer()
           
            Form {
                Section(header: Text("Valore di mercato nuove costruzioni")) {
                    Text("Costo al metro quadro finito")
                    Stepper(value: $valoreDiMercato.myValues, in: 0...30000, step: 50) {
                        Text("€. \(valoreDiMercato.myValues, specifier: "%g")").bold()
                    }.padding(5)
                }
                
                Section(header: Text("Superfici")) {
                    Text("Superficie residenziale lorda").bold().foregroundColor(.green)
                    Stepper(value: $valoreDiMercato.supLord, in: 0...300, step: 1) {
                        Text("Mq. \(valoreDiMercato.supLord, specifier: "%g")").bold()
                    }.padding(10)
                    HStack {
                        Text("Valore Sup. Lorda:").foregroundColor(.gray)
                        Spacer()
                        Text("€. \(valoreDiMercato.calcFloorValue(), specifier: "%g")").bold()
                    }
                  
                Text("Superficie affacci e verande").bold().foregroundColor(.pink)
                Stepper(value: $valoreDiMercato.supSnr, in: 0...300, step: 1) {
                    Text("Mq. \(valoreDiMercato.supSnr, specifier: "%g")").bold()
                }.padding(10)
                    HStack {
                        Text("Valore Sup. Verande:").foregroundColor(.gray)
                        Spacer()
                        Text("€. \(valoreDiMercato.calcSnrValue() , specifier: "%g")").bold()
                    }
                    
                    Text("Superficie cortili").bold().foregroundColor(.orange)
                    Stepper(value: $valoreDiMercato.supCourt, in: 0...300, step: 1) {
                        Text("Mq.   \(valoreDiMercato.supCourt, specifier: "%g")").bold()
                    }.padding(10)
                    
                    HStack {
                        Text("Val. Superfici Corti").foregroundColor(.gray)
                        Spacer()
                        Text("€.   \(valoreDiMercato.calcCourtValue() , specifier: "%g")").bold()

                }
            }
        }
            
            HStack {
                Text("Il valore di partenza è:")
                Spacer()
                Text("€ \(valoreDiMercato.calcFinal(), specifier: "%g")").bold().font(.title2)

            }.padding()
            
          
            NavigationLink("Avanti", destination: VcView(valorePartenza: valoreDiMercato.calcFinal(),valoreDiMercato: StartValue()))
                .padding()
                .font(.title2)
                .foregroundColor(.blue)
            
        } .navigationBarTitle("Valore di mercato", displayMode: .automatic)
      
    }
}

struct StartValueView_Previews: PreviewProvider {
    static var previews: some View {
        StartValueView(valoreDiMercato: StartValue())
    }
}
