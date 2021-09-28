//
//  OrganizationDetail.swift
//  WildSiren
//
//  Created by Cameron de Bruyn on 2021/09/23.
//

import SwiftUI


struct RegistrationForm : View
{
    @State
    private var app = AppViewModel()
    
    @State
    private var image: UIImage? = nil

    @State
    private var userType = 0
    
    var body: some View
    {
        VStack
        {
            Picker("Organization or User", selection: $userType)
            {
                Text("Organization")
                    .tag(0)
                
                Text("User")
                    .tag(1)
            }
            .padding()
            .pickerStyle(.segmented)
            .colorMultiply(Color.secondary)
            
            if userType == 0
            {
                _OrganizationForm(image: $image)
                    .opacity(minValue: 1.0, maxValue: 0.0)
            }
            else
            {
                
            }
            
            Spacer()
        }
        .navigationBarTitle("Register")
    }
}

struct OrganizationPage_Previews : PreviewProvider
{
    static var previews: some View {
        
        RegistrationForm()
    }
}

struct _OrganizationForm : View
{
    @Binding
    internal var image: UIImage?
    
    @State
    private var organization = Organization.empty()
    
    @State
    private var showSheet: Bool = false
    
    @State
    private var registerStatus: Bool = false

    var body: some View
    {
        Form
        {
            Section(header: Text("Organization Information"))
            {
                TextField("Organization Name", text: $organization.name)
                TextField("Email",             text: $organization.contact.email)
                TextField("License",           text: $organization.license)
            }
            
            Section(header: Text("Organization Address"))
            {
                TextField("Address Line 1",    text: $organization.address.addressLine1)
                TextField("Address Line 2",    text: $organization.address.addressLine2)
                TextField("Postal Code",       text: $organization.address.postalCode)
            }
            
            Section(header: Text("Organization Details"))
            {
                TextField("Short Description", text: $organization.shortDescription)
                TextEditor(text: $organization.longDescription)
                    .foregroundColor(Color.secondaryText)
            }
            
            Section(header: Text("Organization Media"))
            {
                HStack
                {
                    Image(uiImage: self.image ?? UIImage())
                        .resizable()
                        .cornerRadius(75)
                        .padding(.all, 6)
                        .frame(width: 150, height: 150)
                        .background(
                            Color.black.opacity(image != nil ? 1.0 : 0.5)
                        )
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(8)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        self.showSheet = true
                        
                    }) {
                        Text("Change Photo")
                            .foregroundColor(.black)
                            .sheet(isPresented: $showSheet)
                        {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: $image)
                        }
                        .padding(.horizontal, Swatch.largeMargin)
                        .padding(.vertical, Swatch.smallMargin)
                    }
                    .background(
                        Color.gray.opacity(0.25)
                    )
                    .cornerRadius(Swatch.cornerRadius)
                }
            }
            
            Section
            {
                Button(action: {
                    
                    self.registerStatus = true
                    
                }) {
                    HStack
                    {
                        Spacer()
                        Text(registerStatus ? "Registered" : "Register")
                        Spacer()
                    }
                }
                .disabled(registerStatus)
            }
        }
    }
}
