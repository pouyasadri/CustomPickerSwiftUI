//
//  ContentView.swift
//  CustomPicker
//
//  Created by Pouya Sadri on 29/04/2024.
//

import SwiftUI

struct ContentView: View {
	@StateObject var  viewModel = PickerViewModel()
    var body: some View {
        FinalView(viewModel:  viewModel)
    }
}

#Preview {
    ContentView()
}

struct FinalView: View {
	@ObservedObject var viewModel : PickerViewModel
	var body: some View {
		ZStack{
			Color.black
				.ignoresSafeArea()
			
			LabelledPicker(label: "I'm", data: PickerData.professions, selectedItem: $viewModel.selectedProfession)
				.offset(x:5,y:70)
			
			LabelledPicker(label: "Age", data: PickerData.ages, selectedItem: $viewModel.selectedAge)
				.offset(x:5,y:270)
			
			Image("Image")
				.resizable()
				.scaledToFill()
				.frame(width: 500,height: 500)
				.clipShape(Circle())
				.overlay(content: {
					Circle().stroke(.white,lineWidth: 5)
				})
				.offset(y:-350)
			
			VStack{
				ZStack{
					Image("download")
						.resizable()
						.scaledToFit()
					viewModel.image?
						.resizable()
						.scaledToFill()
				}
				.onTapGesture {
					viewModel.isShowingPhotoToggle()
				}
				
			}
			.frame(width: 200,height: 200)
			.clipShape(Circle())
			.overlay(content: {
				Circle().stroke(.white.opacity(0.8),lineWidth: 3)
			})
			.offset(y:-140)
			
		}
		.onChange(of: viewModel.inputImage){
			viewModel.loadImage()
		}
		.sheet(isPresented: $viewModel.isShowingPhoto, content: {
			ImagePicker(image: $viewModel.inputImage)
		})
	}
}
