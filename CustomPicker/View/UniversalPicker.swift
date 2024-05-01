//
//  UniversalPicker.swift
//  CustomPicker
//
//  Created by Pouya Sadri on 29/04/2024.
//

import SwiftUI

struct UniversalPicker: UIViewRepresentable{
	var data : [String]
	@Binding var selectedItem : String
	
	func makeCoordinator() -> Coordinator {
		Coordinator(data:data,self)
	}
	
	func makeUIView(context: Context) -> UIPickerView {
		let picker = UIPickerView()
		picker.dataSource = context.coordinator
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIView(_ uiView: UIPickerView, context: Context) {
		if let index = data.firstIndex(of: selectedItem){
			uiView.selectRow(index, inComponent: 0, animated: false)
		}
	}
	
	class Coordinator: NSObject, UIPickerViewDelegate,UIPickerViewDataSource{
		var data : [String]
		var parent : UniversalPicker
		
		init(data: [String],_ parent: UniversalPicker) {
			self.data = data
			self.parent = parent
		}
		
		func numberOfComponents(in pickerView: UIPickerView) -> Int {
			1
		}
		
		func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
			data.count
		}
		
		func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
			let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-100, height: 60))
			
			let label = UILabel(frame: view.bounds)
			label.text = data[row]
			label.textColor = .white
			label.textAlignment = .center
			label.font = .systemFont(ofSize: 22,weight: .bold)
			view.addSubview(label)
			return view
		}
		
		func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
			parent.selectedItem = parent.data[row]
		}
		
		func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
			UIScreen.main.bounds.width - 100
		}
		
		func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
			60
		}
	}
}
