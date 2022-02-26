//
//  SettingsView.swift
//  Fructus
//
//  Created by Jorge Castillo on 2/4/22.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false){
                VStack (spacing: 20) {
                    
                    // MARK: - SECTION 1
                    GroupBox (content:  {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10 ) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potasium , dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    }, label: {
                        SettingsLabelView(labelText: "FRUCTUS", labelImage: "info.circle")
                    })//: - FRUCTUS GROUPBOX
                    // MARK: - SECTION 2
                    GroupBox (content:  {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("RESTARTED")
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("RESTART")
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }//: Toggle
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                    }, label: {
                        SettingsLabelView(labelText: "CUSTOMIZATION", labelImage: "paintbrush")
                    })//: - CUSTOMIZATION GROUPBOX
                    
                    // MARK: - SECTION 3
                    GroupBox (content:  {
                        
                        SettingsRowView(name: "Developer", content: "Jorge Castillo")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                        
                        
                    }, label: {
                        SettingsLabelView(labelText: "APPLICATION", labelImage: "apps.iphone")
                    })//: APPLICATION GROUPBOX
                    
                }//: VSTACK
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                    }
                }//: TOOLBAR
            }//: SCROLL
        }//: NAVIGATION
        
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}
