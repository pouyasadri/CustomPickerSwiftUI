//
//  LabelledPicker.swift
//  CustomPicker
//
//  Created by Pouya Sadri on 29/04/2024.
//

import SwiftUI

struct LabelledPicker: View {
	var label : String
	var data : [String]
	@Binding var selectedItem : String
    var body: some View {
		ZStack{
			RoundedRectangle(cornerRadius: 25)
				.foregroundStyle(.clear)
				.frame(width: 300,height: 80)
				.background(.black)
				.overlay(content: {
					RoundedRectangle(cornerRadius: 25)
						.stroke(.white,lineWidth: 2)
				})
			
			ZStack{
				Circle()
					.foregroundStyle(.black)
					.frame(width: 60,height: 60)
				Text(label)
					.font(.system(size: 24))
					.fontWeight(.medium)
					.foregroundStyle(.white)
			}
			.offset(x:-150)
			
			UniversalPicker(data: data, selectedItem: $selectedItem)
				.frame(width: 180)
		}
    }
}

#Preview {
	LabelledPicker(label: "Age", data: PickerData.ages, selectedItem: .constant("20"))
}
