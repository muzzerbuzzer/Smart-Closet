//
//  ContentView.swift
//  disso
//  test
//  Created by Nika Pakravan on 12/03/2022.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                // success
                self?.signedIn = true
            }
            
        }
    }
    
    func signUp(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            DispatchQueue.main.async {
                // success
                self?.signedIn = true
            }
        }
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                VStack {
                    Text ("You are signed in!")
                    
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Sign Out")
                            .frame(width: 150, height: 50)
                            .background(Color.gray)
                            .foregroundColor(Color.pink)
                            .padding()
                    })
                }
                }
            else {
                SignInView()
            }
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}



struct SignInView: View {
    @State var email = " "
    @State var password = " "
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            VStack {
                TextField("Email", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                
                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                
                Button(action: {
                    
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    
                    viewModel.signIn(email: email, password: password)
                    
                }, label: {
                    Text("Sign In")
                        .foregroundColor(Color.white)
                        .frame(width: 150, height: 50)
                        .cornerRadius(20)
                        .background(Color.purple)
                    
                })
                
                NavigationLink("Create Account", destination: SignUpView())
                    .padding()
                
            }
            .padding()
            
            
            Spacer()
        }
        .navigationTitle("Sign In")
    }
    
    
    struct SignUpView: View {
        @State var email = " "
        @State var password = " "
        
        @EnvironmentObject var viewModel: AppViewModel
        
        var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                VStack {
                    TextField("Email", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.signUp(email: email, password: password)
                        
                    }, label: {
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 150, height: 50)
                            .cornerRadius(20)
                            .background(Color.purple)
                        
                    })
                    
                }
                .padding()
                
                
                Spacer()
            }
            .navigationTitle("Create Account")
        }
        
        
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
                    .preferredColorScheme(.light)
            }
        }
        
    }
}
