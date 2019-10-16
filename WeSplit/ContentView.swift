//
//  ContentView.swift
//  WeSplit
//
//  Created by metalnodeug on 09/10/2019.
//  Copyright © 2019 metalnodeug. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double((Int(numberOfPeople) ?? 0))
        let totalPerPerson = amountWithTip / peopleCount
        
        return totalPerPerson
    }
    
    var amountWithTip: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = (orderAmount * tipSelection) / 100
        let grandTotale = orderAmount + tipValue
        
        return grandTotale
    }

    var colorModifier: Color {
        if tipPercentage == 4 {
            return .red
        } else {
            return .black
        }
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                
                Section {
                    Text("How much tip do you want to leave?")
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("Total Amount with tip value")
                    Text("$\(amountWithTip, specifier: "%.2f")")
                    .foregroundColor(self.colorModifier)
                }
                
                Section{
                    Text("Amount per person")
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                    .foregroundColor(self.colorModifier)
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
