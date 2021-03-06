//
//  ContentView.swift
//  WeSplit
//
//  Created by Shakira Reid-Thomas on 12/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalAmountBeforeDivision: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var totalPerPerson: Double {
        //Calculate the total per person here
        
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
                 Form{
                    Section{
                        TextField("Amount", value: $checkAmount, format: .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        Picker("Number of people", selection: $numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                                } //End of ForEach
                            } // End of Picker
                        } // End of Section
                     
                     
                     Section{
                         Picker("Tip Percentage", selection: $tipPercentage){
                             
                             ForEach(0..<101){
                                 Text($0, format: .percent)
                             }
                         }
                     } // End of Second Section
                 header:{
                     Text("How much top do you want to leave?")
                 }
                     
                     Section{
                         Text(totalAmountBeforeDivision, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                     }
                 header:{
                     Text("Grand Total")
                 }
                     
                     Section{
                         Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        }// End of Third Section
                 header:{
                     Text("Amount Per Person")
                 }
                    } // End of Form
                        .navigationTitle("WeSplit")
                        .toolbar{
                            ToolbarItemGroup(placement: .keyboard){
                                Spacer()
                                Button("Done"){
                             amountIsFocused = false
                         }
                     }
                 } // End of Toolbar
        } // End of NavigationView
    } // End of Body
} // End of ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
