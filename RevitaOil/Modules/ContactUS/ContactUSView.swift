//
//  ContactUSView.swift
//  RevitaOil
//
//  Created by Hassan Ilyas on 03/05/2024.
//

import SwiftUI
import MapKit

struct ContactUSView: View {
    
    @State var fullName = ""
    @State var emailAddress = ""
    @State var phoneNo = ""
    @State var message = ""
    
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 26.15278123798636, longitude: -81.7657137039844),
                           span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))

    var body: some View {
        NavigationStack{
            Divider()
                .padding(.bottom, 10)
                .foregroundColor(Color(hex: "#544848"))
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    CustomTextFieldView(title: "Full Name", placeholder: "Full Name", text: $fullName)
                    
                    CustomTextFieldView(title: "Email Address", placeholder: "Email Address", text: $emailAddress)
                        .keyboardType(.emailAddress)
                    
                    CustomTextFieldView(title: "Phone No", placeholder: "Phone No", text: $phoneNo)
                        .keyboardType(.phonePad)
                    
                    TextEditorWithPlaceholderView(title: "Message", placeholder: "Write Message...", text: $message)
                    
                    Map(position: $cameraPosition)
                        .cornerRadius(2)
                        .frame(height: screenWidth / 1.8)
                    
                    Text("Contact Us")
                        .font(.customFont(font: .sfPro, style: .medium, size: 16))
                        .frame(width: screenWidth - 40)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 15) {
                            Image("phone")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height: 16)
                            
                            Link("(941) 216-1167", destination: URL(string: "tel:9412161167")!)
                                .font(.customFont(font: .sfPro, style: .medium, size: 12))
                                .foregroundColor(Color(hex: "#221F1F"))
                        }
                        
                        HStack(spacing: 15) {
                            Image("email")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height: 16)
                            
                            Link("info@revitaoil.com", destination: URL(string: "mailto:info@revitaoil.com")!)
                                .font(.customFont(font: .sfPro, style: .medium, size: 12))
                                .foregroundColor(Color(hex: "#221F1F"))
                        }
                        
                        HStack(spacing: 15) {
                            Image("location")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 16, height: 16)
                            
                            Text("3400 Radio Road #109B Naples, Florida 34104")
                                .font(.customFont(font: .sfPro, style: .medium, size: 12))
                                .foregroundColor(Color(hex: "#221F1F"))
                        }
                    }
                    
                    Button(action: {
                        
                    }, label: {
                        Text("SEND MESSAGE")
                            .foregroundColor(.white)
                            .font(.customFont(font: .sfPro, style: .medium, size: 16))
                    })
                    
                    .frame(width: screenWidth - 40, height: 50)
                    .background(Color("buttonColor"))
                    .cornerRadius(2)
                    .padding(.top, 30)
                    
                }
                .padding([.leading, .trailing, .bottom], 20)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack{
                        Text("CONTACT US")
                            .font(.customFont(font: .sfPro, style: .medium, size: 20))
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    ContactUSView()
}
