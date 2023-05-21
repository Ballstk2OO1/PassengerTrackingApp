//
//  BusDriverEdit.swift
//  passenger
//
//  Created by YZR-M1 on 16/2/2566 BE.
//

import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var presentationMode: PresentationMode
        @Binding var selectedImage: UIImage?

        init(presentationMode: Binding<PresentationMode>, selectedImage: Binding<UIImage?>) {
            _presentationMode = presentationMode
            _selectedImage = selectedImage
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                selectedImage = uiImage
            }

            presentationMode.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode, selectedImage: $selectedImage)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}

struct BusDriverEdit: View {
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var phoneNumber: String = ""
    @State private var carRegistration: String = ""
    @State private var selectedImage: UIImage? = nil

    @State private var isShowingImagePicker: Bool = false

    var body: some View {
        
        Image("busdriver")
            .resizable()
            .scaledToFit()
            .aspectRatio(contentMode: .fit)
            .frame(height: 250)
        
        VStack {
            
            Spacer()
            
            VStack {
                
                HStack{
                    Image(systemName: "person")
                    TextField("Firstname", text: $firstname)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "person")
                    TextField("Lastname", text: $lastname)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "phone")
                    TextField("Contact", text: $phoneNumber)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
                HStack{
                    Image(systemName: "bus")
                    TextField("Car Registration", text: $carRegistration)
                    
                    Spacer()
                    
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.black)
                )
                .padding(.horizontal)
                .padding(.vertical, 5)
                
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.black)
//                    TextField("ชื่อ", text: $firstname)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//
//                HStack {
//                    Image(systemName: "person")
//                        .foregroundColor(.black)
//                    TextField("นามสกุล", text: $lastname)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
//
//                HStack {
//                    Image(systemName: "phone")
//                        .foregroundColor(.black)
//                    TextField("เบอร์โทรศัพท์", text: $phoneNumber)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                        .keyboardType(.phonePad)
//                }
//
//                HStack {
//                    Image(systemName: "car")
//                        .foregroundColor(.black)
//                    TextField("หมายเลขทะเบียนรถโดยสาร", text: $carRegistration)
//                        .textFieldStyle(BottomLineTextFieldStyle())
//                }
                    
            }
            .padding(5)

            Spacer()

            Button(action: {
                
            }, label: {
                Text("Update")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth:.infinity)
                    .frame(alignment: .center)
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.4), radius: 15, x: 0.0, y: 10)
                    .padding()
                    })
                    }
                    .padding()
                    .navigationBarTitle("Edit Profile")
                    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
    }
}

struct BusDriverEdit_Previews: PreviewProvider {
    static var previews: some View {
        BusDriverEdit()
    }
}

