//
//  ContentView.swift
//  TensorFlow
//
//  Created by Tacettin Pekin on 12.10.2023.
//

import SwiftUI
import TensorFlowLite


struct ContentView: View {
    private let tensorFlowLiteManager = TensorFlowLiteManager()
    
    var body: some View {
        VStack {
            Button(action: {
                let inputData = Data()  // Replace with your actual input data
                tensorFlowLiteManager.runInference(inputData: inputData)
            }) {
                Text("Run Inference")
            }
            // Your other UI elements
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
