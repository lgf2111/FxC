//
//  FxField.swift
//  FxC Watch App
//
//  Created by Lee Guan Feng on 22/2/23.
//

import SwiftUI
import SwiftUI_Apple_Watch_Decimal_Pad

struct FxField: View {
    @Binding var value: String
    @Binding var code: String
    @State var locked: Bool = false

    @State var presentKeyboard: Bool = false

    var body: some View {
        HStack {
            DigiTextView(
                placeholder: "0.00",
                text: $value,
                presentingModal: presentKeyboard,
                alignment: .trailing,
                style: .decimal
            )
            Text(code)
        }
    }
}


struct FxField_Previews: PreviewProvider {
    static var previews: some View {
        FxField(value: .constant("0.58"), code: .constant("VND"))
    }
}
