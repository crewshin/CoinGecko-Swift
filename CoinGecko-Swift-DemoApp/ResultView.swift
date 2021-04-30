//
// GeneCrucean.swift
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var output: Output
    
    var body: some View {
        TextEditor(text: $output.value)
            .font(.caption)
            .foregroundColor(.pink)
            .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing:8))
    }
}
