//
//  Binding-OnChange.swift
//  UltimatePortfolio
//
//  Created by Berkant Dursun on 26.12.20.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
