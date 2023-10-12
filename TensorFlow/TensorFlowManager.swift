//
//  TensorFlowManager.swift
//  TensorFlow
//
//  Created by Tacettin Pekin on 12.10.2023.
//

import Foundation
import TensorFlowLite

class TensorFlowLiteManager {
    private var interpreter: Interpreter?
    
    init() {
        guard let modelPath = Bundle.main.path(forResource: "face_landmark_media", ofType: "tflite") else {
            print("Failed to load the model")
            return
        }
        do {
            let options = Interpreter.Options()
            interpreter = try Interpreter(modelPath: modelPath, options: options)
            try interpreter?.allocateTensors()
        } catch let error {
            print("Failed to create the interpreter with error: \(error.localizedDescription)")
        }
    }
    
    func runInference(inputData: Data) {
        do {
            try interpreter?.copy(inputData, toInputAt: 0)
            try interpreter?.invoke()
            let outputTensor = try interpreter?.output(at: 0)
            // Process the output tensor
        } catch let error {
            print("Failed to invoke the interpreter with error: \(error.localizedDescription)")
        }
    }
}

