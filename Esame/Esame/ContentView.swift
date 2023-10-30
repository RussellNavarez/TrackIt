//
//  ContentView.swift
//  Esame
//
//  Created by user243601 on 10/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
              
                VStack {
                    Text("TrackIt")
                        .font(
                            .system(size: 45)
                            .weight(.heavy)
                        )
                    
                        .padding(5)
                    Text("Spend Smarter")
                        .font(
                            .system(size: 25)
                            .weight(.semibold))
                       
                    Text("Save More")
                        .font(
                            .system(size: 25)
                            .weight(.semibold))
                       
                    NavigationLink(destination: RegisterView()
                        .environmentObject(AuthViewModel())) {
                        Text("Get Started")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(25)
                    }
                    NavigationLink(destination: LoginView()
                        .environmentObject(AuthViewModel())) {
                        Text("Already have an account? Sign In")
                            .font(.system(size: 15))
                    }
                }
                
                
             
            }
            .ignoresSafeArea()

            
        }
     
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
        
    }
}
    
