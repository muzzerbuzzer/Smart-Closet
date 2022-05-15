//
//  ButtonComponentView.swift
//  disso
//
//  Created by Nika Pakravan on 04/04/2022.
//

//Creates buttons without having to re-write the code multiple times
/*This code has been re-used from tundsdev's
 'Firebase SwiftUI Auth, Login, Registration, Password Reset, Sign Out - Bug Fix In Description' video tutorial on YouTube*/
import SwiftUI

struct ButtonComponentView: View {
    
    //provides a new name for the existing data type
    typealias ActionHandler = () -> Void
    
    let title: String
    let background: Color
    let foreground: Color
    let border: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 10
    
    //initialises the button component, with everything it includes
    internal init(title: String,
                  background: Color = .purple,
                  foreground: Color = .white,
                  border: Color = .clear,
                  handler: @escaping ButtonComponentView.ActionHandler) {
        self.title = title
        self.background = background
        self.foreground = foreground
        self.border = border
        self.handler = handler
    }
    
    var body: some View {
        //creats the actual button
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 50)
        })
        .background(background)
        .foregroundColor(foreground)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(border, lineWidth: 2)
        )
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonComponentView(title: "Primary Login Button") { }
                .preview(with: "Primary Login Button View")
            ButtonComponentView(title: "Secondary Login Button",
                                background: .clear,
                                foreground: .purple,
                                border: .purple) { }
                .preview(with: "Secondary Login Button View")
        }
    }
}
