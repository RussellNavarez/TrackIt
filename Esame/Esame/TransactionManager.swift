//
//  TransactionManager.swift
//  Esame
//
//  Created by user243601 on 10/19/23.
//

import Foundation
import Combine
import Supabase


class TransactionManager {
    let client = SupabaseClient(supabaseURL: URL(string: "https://mcqvxlmbqoejlecoqkfe.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jcXZ4bG1icW9lamxlY29xa2ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcwMzE1MjMsImV4cCI6MjAxMjYwNzUyM30.bkRqeAN-3FCbwTE8r8p2MAVsQlmZGfkZTQHXlN0xUR4")
  
}

struct Transaction: Identifiable, Decodable, Encodable {
    var id: UUID
    let name: String
    let amount: Double
    let createdAt: Date
    let userid: UUID
   
}
