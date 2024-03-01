//
//  AccountView.swift
//  Appetizers
//
//  Created by Rahul Kumar on 23/12/23.
//

import SwiftUI
import AudioToolbox

struct AccountView: View {
    
    enum FormTextField {
        case firstName, lastName, email
    }
    
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState var focusedTextField: FormTextField?
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("PERSONAL INFO")) {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.done)
                    
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                    
                    DatePicker("Birthday",
                               selection: $viewModel.user.birthday,
                               in: Date().oneHundredYearAgo...Date().eighteenYearAgo,
                               displayedComponents: .date)
                    Button(action: {
                        viewModel.performSaveChanges()
                    }, label: {
                        Text("Save Changes")
                    })
                }
                
                Section(header: Text("REQUESTS")) {
                    Toggle("Extra Napkin", isOn: $viewModel.user.extraNapkin)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefill)
                }
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button {
                            focusedTextField = nil
                            AudioServicesPlaySystemSound(1156)
                        } label: {
                            Text("Done")
                                .fontWeight(.semibold)
                        }
                    }
                    
                }
            })
            .tint(.brandPrimary)
            .navigationTitle("Account")
        }
        .onAppear {
            viewModel.fetchUserData()
        }
        
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
}

#Preview {
    AccountView()
}
