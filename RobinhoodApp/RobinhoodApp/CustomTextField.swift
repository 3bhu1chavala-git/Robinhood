//
//  CustomTextField.swift
//  RobinhoodApp
//
//  Created by 3bhu1chavala on 02/05/25.
//

import SwiftUI

struct CustomTextField: View {
    let placeholder: String
    let isSecure: Bool
    @Binding var text: String
    
    init(_ placeholder: String, text: Binding<String>, isSecure: Bool = false) {
        self.placeholder = placeholder
        self._text = text
        self.isSecure = isSecure
    }
    
    var body: some View {
        Group {
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none)
    }
}

#Preview {
    CustomTextField("Email", text: .constant(""))
}
