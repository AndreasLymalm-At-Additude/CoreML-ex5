//
//  ContentView.swift
//  uppgift-5
//
//  Created by Andreas Lymalm on 2023-11-02.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var Prediction = ""
    @State var PredictionColor: Color = .white
    @State var CorrectAnswer = ""
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    let cat = UIImage(named: "cat-with-sunglasses")!
                    
                    Image(uiImage: cat)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Button(action: {
                        let result = MachineLearning.PredictImage(image: cat)
                        if (result != nil) {
                            Prediction = result!
                            PredictionColor = .gray
                            CorrectAnswer = "Cat"
                        }
                    }) {
                        Text("Predict animal")
                            .foregroundStyle(.gray)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 3)
                                    .foregroundStyle(.gray)
                            )
                    }
                }
            }
            Text(String(Prediction))
                .font(.system(size: 30))
                .frame(maxWidth: .infinity)
                .padding()
                .background(PredictionColor)
            HStack {
                if (CorrectAnswer != "") {
                    Text("Correct answer:")
                    Text(String(CorrectAnswer))
                        .italic()
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
