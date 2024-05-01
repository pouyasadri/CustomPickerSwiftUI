//
//  PhotoPickerView.swift
//  CustomPicker
//
//  Created by Pouya Sadri on 29/04/2024.
//

import SwiftUI
import PhotosUI

struct ImagePicker : UIViewControllerRepresentable{
	@Binding var image : UIImage?
	
	func makeUIViewController(context: Context) -> PHPickerViewController {
		var config = PHPickerConfiguration()
		config.filter = .images
		
		let picker = PHPickerViewController(configuration: config)
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
		
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	class Coordinator: NSObject, PHPickerViewControllerDelegate{
		var parent : ImagePicker
		
		init(_ parent: ImagePicker) {
			self.parent = parent
		}
		
		func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
			picker.dismiss(animated: true)
			
			guard let provider = results.first?.itemProvider,provider.canLoadObject(ofClass: UIImage.self) else{ return}
			
			provider.loadObject(ofClass: UIImage.self){
				[weak self] (image, error) in
				
				DispatchQueue.main.async {
					if let image = image as? UIImage{
						self?.parent.image = image
					}
				}
			}
		}
	}
}
