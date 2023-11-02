//
//  MachineLearning.swift
//  uppgift-5
//
//  Created by Andreas Lymalm on 2023-11-02.
//

import Foundation
import UIKit
import Vision

class MachineLearning {
    static func PredictImage(image: UIImage) -> String? {
        
        let defaultConfig = MLModelConfiguration()
        let imageClassifierWrapper = try? AnimalImageFinder(configuration: defaultConfig)
                
        let imageBuffer = Helper.Buffer(from: image)!
        
        do {
            let output = try imageClassifierWrapper!.prediction(image: imageBuffer)
            return "\(output.classLabel) (\(Helper.ToPercent(decimalNumber: output.classLabelProbs[output.classLabel]!)))"
        } catch {
            return nil
        }
    }
}
