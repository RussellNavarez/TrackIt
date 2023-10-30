//
//  TransactionView.swift
//  Esame
//
//  Created by user243601 on 10/25/23.
//

import SwiftUI
import Foundation
import Supabase

struct TransactionView: View {
    @State private var name = ""
    @State private var amount: Double = 0.0
    @State private var createdAt = Date()
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://mcqvxlmbqoejlecoqkfe.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jcXZ4bG1icW9lamxlY29xa2ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcwMzE1MjMsImV4cCI6MjAxMjYwNzUyM30.bkRqeAN-3FCbwTE8r8p2MAVsQlmZGfkZTQHXlN0xUR4")
    
    @StateObject private var transactionService = TransactionService()
    @StateObject private var supabaseAuth = SupabaseAuth()
   
    
    var body: some View {
       
            VStack{
                Text("Add transaction")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding()
                Form {
                    Section(header: Text("Expense Details")) {
                        TextField("Name", text: $name)
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        TextField("Amount", value: $amount, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                        DatePicker("Date", selection: $createdAt, displayedComponents: .date)
                    }
                    .padding()
                }
                
                Button(action: {
                    Task {
                        do {
                            if let userID = try await supabaseAuth.getUserId() {
                                // Create a transaction with user-provided data
                                let transaction = Transaction(id: UUID(), name: name, amount: amount, createdAt: createdAt, userid: userID)
                                
                                // Save the transaction to your database using the Supabase client
                                _ = try await client.database.from("transaction").insert(values: [transaction])
                                    .execute()
                                
                            } else {
                                // Handle the case where the user is not signed in.
                            }
                        } catch {
                            // Handle any errors that may occur while getting the user ID.
                            print("Error: \(error)")
                        }
                    }
                }) {
                    Text("Add transaction")
                        .frame(maxWidth: .infinity)
                }

                    
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .controlSize(.large)
                .disabled(name.isEmpty || amount == 0.0)
                .navigationBarBackButtonHidden()
                
        }
        }
            

    struct TransactionView_Previews: PreviewProvider {
        static var previews: some View {
            TransactionView()
        }
    }
