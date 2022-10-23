//
//  CheckoutView.swift
//  iSip
//
//  Created by Elijah Armande on 10/23/22.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var PaymentType = "Cash"
    @State private var addCreditCardNumber = false
    @State private var creditCardNumber = ""
    @State private var tipAmount = 15
    @State private var showingPaymentAlert = false
    
    
    let paymentTypes = ["Cash", "Credit Card", ]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("Payment Method", selection: $PaymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                
                Toggle("Add Credit Card Number", isOn:
                        $addCreditCardNumber.animation())
                
                if addCreditCardNumber {
                    TextField("Enter Credit Card Number", text: $creditCardNumber)
                }
            }
                
                Section(header: Text("Add a tip?")) {
                    Picker("Percentage:", selection: $tipAmount) {
                        ForEach(tipAmounts, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                        Text("TOTAL: \(totalPrice)")
                .font(.largeTitle)
            ) {
                Button("Confirm Order") {
                    showingPaymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
