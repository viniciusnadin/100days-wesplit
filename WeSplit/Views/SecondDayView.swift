//
//  SecondDayView.swift
//  WeSplit
//
//  Created by Vinicius Nadin on 02/03/22.
//

import SwiftUI

struct SecondDayView: View {
    
    // @State because we want to read and rwite var values from struct
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 1
    @State private var tipPercentage = 20
    
    // Handle input focus in UI
    @FocusState private var amountIsFocused: Bool
    
    private let tipPercentages = [0, 10, 15, 20, 25]
    
    // Computed property to calculate the total per person
    private var totalPerPerson: Double {
        let peopleCount = Double(self.numberOfPeople + 1)
        let tipSelection = Double(self.tipPercentage)
        let tipValue = Double(self.checkAmount / 100 * tipSelection)
        
        let grandTotal = self.checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // $ simple to make the variable a 2 way binding
                    // Locale.current.currencyCode gets the local currency of the device
                    // .keyboardType is a modifier
                    TextField("Amount", value: self.$checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                    // Modifier to set to the var when this field are focused
                        .focused(self.$amountIsFocused)
                    
                    Picker("Number of people", selection: self.$numberOfPeople) {
                        ForEach(1 ..< 100) {
                            Text("\($0)")
                        }
                    }
                    // Put the header of the section
                } header: {
                    Text("Put the value and the number of guys")
                }
                
                Section {
                    // \.self tells to swift that object are 'id' and unique
                    Picker("Tip percentage", selection: self.$tipPercentage) {
                        ForEach(self.tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(self.totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                } header: {
                    Text("Total value for each person")
                }
                // We put the navigationTitle in the form because navigation view are capable of showing many views as your program runs.
            }
                .navigationTitle("WeSplit")
            // Create a toolbar to put some itens inside it
                .toolbar {
                    // Create a toolbar in a specific location
                    ToolbarItemGroup(placement: .keyboard) {
                        // Spacer put views in a side, can be in any direction
                        Spacer()
                        Button("Done") {
                            // When done button is clicked, we set the focus false and the keyboard disappear 
                            self.amountIsFocused = false
                        }
                    }
                }
        }
    }
}

struct SecondDayView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDayView()
    }
}
