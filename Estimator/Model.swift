//
//  Model.swift
//  Observable Trainer
//
//  Created by salvatore dessena on 29/10/2020.
//

import SwiftUI


class StartValue: ObservableObject {
    
    //Source of Truth
    @Published var myValues: Double = 0.00
   
    // Valori per gli stepper StartValueView
    @Published var supLord: Double = 0.00
    @Published var supSnr: Double = 0.00
    @Published var supCourt: Double = 0.00
    
    //fattori per gli stepper StartValueView
    @Published var factorSnr: Double = 0.25
    @Published var factorCourt: Double = 0.10
    
 
  
  //Funzioni per il calcolo dei parziali sugli stepper StartValueView
    func calcFloorValue() -> Double {
        let sub1 = myValues * supLord
        return sub1
    }
    
    func calcSnrValue() -> Double {
        let sub2 = myValues * supSnr * factorSnr
        return sub2
    }
    
    func calcCourtValue() -> Double {
        let sub3 = myValues * supCourt * factorCourt
        return sub3
    }
    
    func calcFinal() -> Double {
        // qui c'è un problema.
        let sub4 =   calcCourtValue() + calcSnrValue() + calcFloorValue()
        return sub4
    }
    
    //properties per gli elementi edilizi VcView
    @Published  var structValue: Double = 0
    @Published  var roofValue: Double = 0
    @Published  var windowsValue: Double = 0
    @Published  var plasterValue: Double = 0
    @Published  var floorsValue: Double = 0
    @Published  var installationsValue: Double = 0
    
    //Dict per assegnare i coefficienti e valori sullo Slider VcView
    @Published var factorAndDefinitions: Dictionary = [-0.20: "Scarso",  -0.10: "Mediocre",  0.00: "Ordinario",  0.10: "Buono",  0.20: "Eccellente"]
    
    //fattori di riduzione per componenti VcView
    @Published var factorStruct: Double = 0.25
    
    // funzioni per il calcolo finale  VcView
    func calcStruct(valorediPartenza: Double) -> Double {
        let calc1 = valorediPartenza  * factorStruct * structValue
             return calc1
    }
        
}

