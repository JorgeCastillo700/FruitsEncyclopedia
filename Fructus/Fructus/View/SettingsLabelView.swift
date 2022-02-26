//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Jorge Castillo on 2/25/22.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    var labelText: String
    var labelImage: String
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(labelText).fontWeight(.bold)
            Spacer()
            Image(systemName: labelImage)
        }
    }
}


// MARK: - PREVIEW
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(labelText: "FRUCTUS", labelImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
 }
}
