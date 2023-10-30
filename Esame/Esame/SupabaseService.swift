//
//  SupabaseService.swift
//  Esame
//
//  Created by user243601 on 10/17/23.
//
import Foundation
import Supabase

class SupabaseService {
    private let supabase: SupabaseClient

    init() {
        // Replace with your Supabase project's URL and API key
        supabase = SupabaseClient(supabaseURL: URL(string: "https://mcqvxlmbqoejlecoqkfe.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jcXZ4bG1icW9lamxlY29xa2ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcwMzE1MjMsImV4cCI6MjAxMjYwNzUyM30.bkRqeAN-3FCbwTE8r8p2MAVsQlmZGfkZTQHXlN0xUR4")
    }

    // Function for user registration with username, email, and password
       func signUp(username: String, email: String, password: String, completion: @escaping (Result<Data?, Error>) -> Void) {
           let userData = [
               "username": username,
               "email": email,
               "password": password
           ]
           
           supabase.auth.signUp(email: email, password: password) { result in
               switch result {
               case .success(let response):
                   completion(.success(response.data))
               case .failure(let error):
                   completion(.failure(error))
               }
           }
       }

       // Function for user login with email and password
       func signIn(email: String, password: String, completion: @escaping (Result<Data?, Error>) -> Void) {
           supabase.auth.signIn(email: email, password: password) { result in
               switch result {
               case .success(let response):
                   completion(.success(response.data))
               case .failure(let error):
                   completion(.failure(error))
               }
           }
       }

       // Function to check if a user is already registered (based on session)
       func isUserRegistered() -> Bool {
           return supabase.auth.currentUser() != nil
       }

       // Function for user signout
       func signOut(completion: @escaping (Error?) -> Void) {
           supabase.auth.signOut { error in
               completion(error)
           }
       }
   }
