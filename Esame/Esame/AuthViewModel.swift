//
//  AuthViewModel.swift
//  Esame
//
//  Created by user243601 on 10/17/23.
//

import Foundation
import Combine
import Supabase


enum AuthState:Hashable{
    case Initial
    case Signin
    case Signout
}

class AuthViewModel: ObservableObject{
    
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var errorMessage:String = ""
    var cancellable=Set<AnyCancellable>()
    @Published var authState:AuthState = AuthState.Initial
    private var supabaseAuth:SupabaseAuth = SupabaseAuth()
    @Published var isLoading  = false
    @Published var isRegistered = false
    @Published var isLogged = false
    @Published var isLoggedOut = false
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://mcqvxlmbqoejlecoqkfe.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jcXZ4bG1icW9lamxlY29xa2ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTcwMzE1MjMsImV4cCI6MjAxMjYwNzUyM30.bkRqeAN-3FCbwTE8r8p2MAVsQlmZGfkZTQHXlN0xUR4")
    
    func getEmail() -> String {
            return email
        }

        // Getter function to fetch the password
    func getPassword() -> String {
            return password
        }
    
    @MainActor
    func isUserSignIn() async  {
        do{
            try await supabaseAuth.LoginUser()
            authState = AuthState.Signin
            
        }catch _{
            authState = AuthState.Signout
        }
        
        
    }
  
    
    @MainActor
    func signup(email:String,password:String) async  {
        do{
            isLoading = true
            try await supabaseAuth.SignUp(email: email, password: password)
            authState = AuthState.Signin
            isLoading = false
            isRegistered = true
            
        }
        catch let error{
            errorMessage = error.localizedDescription
            isLoading = false
        }
        
        
        
    }
    
    @MainActor
    func signIn(email:String,password:String) async {
        do{
            isLoading = true
            try await supabaseAuth.SignIn(email: email, password: password)
            
            authState = AuthState.Signin
            isLoading = false
            isLogged = true
          
        }
        catch let error{
            errorMessage = error.localizedDescription
            isLoading = false
        }
    }
    
    
    
    
    
    func validEmail() -> Bool {
        
        let emailRegex = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let isEmailValid = self.email.range(of: emailRegex, options: .regularExpression) != nil
        
        
        return isEmailValid
    }
    
    func validPassword() -> Bool {
        
        let passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        let isPasswordValid = self.password.range(of: passwordRegex, options: .regularExpression) != nil
        
        return isPasswordValid
    }
    
    @MainActor
    func signoutUser() async{
        do{
            try await supabaseAuth.signOut()
            authState = AuthState.Signout
            isLoggedOut = true
            email = ""
            password = ""
        }catch let error{
            errorMessage = error.localizedDescription
        }
        
    }
    
    
}
