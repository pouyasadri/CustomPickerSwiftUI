//
//  PickerViewModel.swift
//  CustomPicker
//
//  Created by Pouya Sadri on 29/04/2024.
//

import SwiftUI

class PickerViewModel : ObservableObject{
	@Published var selectedProfession = "Blogger"
	@Published var selectedAge = "28"
	@Published var image : Image?
	@Published var isShowingPhoto = false
	@Published var inputImage : UIImage?
	
	func loadImage(){
		guard let inputImage = inputImage else{return}
		image = Image(uiImage: inputImage)
	}
	
	func isShowingPhotoToggle(){
		isShowingPhoto.toggle()
	}
}
