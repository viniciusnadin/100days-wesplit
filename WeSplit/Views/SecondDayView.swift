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
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    private let tipPercentages = [0, 10, 15, 20, 25]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // $ simple to make the variable a 2 way binding
                    // Locale.current.currencyCode gets the local currency of the device
                    // .keyboardType is a modifier
                    TextField("Amount", value: self.$checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Picker("Number of people", selection: self.$numberOfPeople) {
                    ForEach(1 ..< 100) {
                        Text("\($0)")
                    }
                }
                
                Section {
                    Text(self.checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }
                // We put the navigationTitle in the form because navigation view are capable of showing many views as your program runs.
            }.navigationTitle("WeSplit")
        }
    }
}

struct SecondDayView_Previews: PreviewProvider {
    static var previews: some View {
        SecondDayView()
    }
}
