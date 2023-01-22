//
//  UIKitSliderView.swift
//  SliderGame
//
//  Created by Анастасия Булдакова on 22.01.2023.
//

import SwiftUI

struct UIKitSliderView: UIViewRepresentable {

    @Binding var valueSlider: Double
    var opacitySlider: Double
    
    func makeUIView(context: Context) -> UISlider {
     
        let slider = UISlider()
        slider.minimumTrackTintColor = .red
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .red.withAlphaComponent(opacitySlider)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(valueSlider: $valueSlider)
    }
    
}

extension UIKitSliderView{
    
    class Coordinator: NSObject {
        @Binding private var valueSlider: Double
        
        init(valueSlider: Binding<Double>) {
            self._valueSlider = valueSlider
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            valueSlider = Double(sender.value)
        }
    }
}

struct UIKitSliderView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSliderView(valueSlider: .constant(50), opacitySlider: 0.3)
    }
}
