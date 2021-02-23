//
//  CheckOutView.swift
//  DiveDine
//
//  Created by Ravi Singh on 05/02/20.
//  Copyright © 2020 Ravi Singh. All rights reserved.
//

import SwiftUI

struct CheckOutView: View {
    @EnvironmentObject var order: Order
    
    static let  paymentMode = ["Cash","Debit Card","Credit Card","Dine Loyality Point"]
    static let tipAmounts = [5,10,15,20]
    
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 0
    @State private var paymentAlert = false
    
    var  totalPrice : Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(CheckOutView.self.tipAmounts[tipAmount])
        return tipValue + total
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How to pay Bill", selection: $paymentType) {
                    ForEach(0 ..< CheckOutView.self.paymentMode.count) {
                        Text(CheckOutView.self.paymentMode[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add Loyality number")
                }
                
                if addLoyaltyDetails {
                   TextField("Enter your number", text: $loyaltyNumber)
                    
                    .keyboardType(.decimalPad)
                }
                
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach (0 ..< CheckOutView.tipAmounts.count) {
                        Text("\(CheckOutView.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("RS \(totalPrice, specifier: "%.2f")")
                .font(.largeTitle)
                ){
                
                Button("Confirm order") {
                    self.paymentAlert.toggle()
                    
                }
            }
            
          
        }
        .navigationBarTitle(Text("Payment Mode"), displayMode: .inline)
        .alert(isPresented: $paymentAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Your payment is successful and your amount is \(totalPrice, specifier: "%.2f")- Thank You!"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
     static let order = Order()
    
    static var previews: some View {
        CheckOutView().environmentObject(order)
        
    }
}
