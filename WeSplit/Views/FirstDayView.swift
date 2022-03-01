//
//  FirstDayView.swift
//  WeSplit
//
//  Created by Vinicius Nadin on 28/02/22.
//

import SwiftUI

struct FirstDayView: View {
    var body: some View {
        
        // NAVIGATION VIEW
        NavigationView {
            // FORM
            VStack {
                Form {
                    // IN SWIFTUI WE HAVE THE MAX OF 10 ITENS IN A ROW
                    // TO PUT MORE ITENS, JUST ADD IN A 'GROUP'
                    // GROUP DOESN'T DO ANYTHING IN VIEW, JUST TO GROUP MORE THAN 10 ITENS
                    Group {
                        // SECTION IS A VISUAL COMPONENT TO SEPARETE THINGS IN THE FORM
                        Section {
                            // BASIC TEXT
                            Text("Hello, world!").padding()
                            Text("Hello, world!").padding()
                            Text("Hello, world!").padding()
                        }
                        
                        Section {
                            Text("Hello, world!").padding()
                            Text("Hello, world!").padding()
                            Text("Hello, world!").padding()
                        }
                    }
                    // WE SET A TITLE TO OUR VIEW
                }.navigationTitle("Title").navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct FirstDayView_Previews: PreviewProvider {
    static var previews: some View {
        FirstDayView()
    }
}
