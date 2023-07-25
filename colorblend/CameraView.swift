//
//  CameraView.swift
//  colorblend
//
//  Created by Adinda Dwi on 10/07/23.
//


import SwiftUI
import AVFoundation
struct CameraView: View {
    @StateObject var camera = CameraModel()
    @State private var showSheet = false

    var body: some View {
        ZStack {

            CameraPreview(camera: camera)
                .ignoresSafeArea()

            VStack{
                Image(systemName: "scope")
                    .resizable()
                    .frame(width: 40, height: 40)
            }

            VStack {
                Spacer()

                if !camera.isTaken {
                    Button(action: camera.takePic, label: {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 65, height: 65, alignment: .center)
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .frame(width: 75, height: 75, alignment: .center)
//                            HStack{
//                                Spacer()
//                                Button(action: {
//
//                                }, label: {
//                                    Image(systemName: "arrow.triangle.2.circlepath.camera")
//                                        .foregroundColor(.black)
//                                        .padding()
//                                        .background(Color.white)
//                                        .clipShape(Circle())
//                                })
//
//                            }
//                            .padding(.trailing, 20)
//                            .padding(.leading, 10)
//                            .padding(.bottom, 10)
//                            Spacer()
                        }
                        .padding(.bottom, 20)
                    })
                } else {
                    Spacer()
                    HStack{
                        Button(action: {
                            // Handle retaking the photo
                            camera.reTake()
                        }, label: {
                            Image(systemName: "arrow.triangle.2.circlepath.camera")
                                .foregroundColor(.black)
                                .padding()
                                .background(Color.white)
                                .clipShape(Circle())
                        })
                        .padding(.trailing, 10)
                        .padding(.leading, 20)
                        .padding(.bottom, 30)

                        Spacer()

//                        Button(action: {
//                            // Handle using the captured photo
//                            showSheet = true
//                            // Do something with the captured photo here
//                        }, label: {
//                            Text("Use Photo")
//                                .foregroundColor(.black)
//                                .fontWeight(.semibold)
//                                .padding(.vertical, 10)
//                                .padding(.horizontal, 20)
//                                .background(Color.white)
//                                .clipShape(Capsule())
//                        })
                    }
                }
            }
        }


        .sheet(isPresented: $showSheet) {
            if let image = camera.capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("No photo captured")
            }
        }
        .onAppear(perform: {
            camera.check()
        })
        .alert(isPresented: $camera.alert) {
            Alert(title: Text("Enable camera"))
        }

    }

}



struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


class CameraModel : NSObject, ObservableObject, AVCapturePhotoCaptureDelegate{
    @Published var isTaken = false
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()

    @Published var capturedImage: UIImage?

    @Published var preview : AVCaptureVideoPreviewLayer!

    @Published var showSheet = false
    @Published var picData = Data(count:0)
    func check(){

        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .notDetermined :
            AVCaptureDevice.requestAccess(for: .video) { (status) in
                if status{
                    self.setUp()
                }
            }
        case .denied:
            self.alert.toggle()
            return

        default:
            return
        }
    }

    func setUp(){
        do{
            self.session.beginConfiguration()

            guard let device: AVCaptureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
                return
            }
            let input = try AVCaptureDeviceInput(device: device)
            if self.session.canAddInput(input){
                print("input taken")
                self.session.addInput(input)
            }else{
                print("input not  taken")
            }
            if self.session.canAddOutput(output){
                print("output taken")
                self.session.addOutput(output)
            }
            self.session.commitConfiguration()
        }catch{
            print(error.localizedDescription)
        }
    }

    func takePic() {
        self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        DispatchQueue.global(qos: .background).async {
            self.session.stopRunning()
            DispatchQueue.main.async {
                withAnimation {
                    self.isTaken.toggle()
                    self.showSheet = true // Present the sheet when a photo is captured
                }
            }
        }
    }


    func reTake(){

        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation{
                    self.isTaken.toggle()

                }
                self.picData=Data(count: 0)

            }
        }
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            print("Error capturing photo: \(error.localizedDescription)")
            return
        }

        guard let imageData = photo.fileDataRepresentation(), let image = UIImage(data: imageData) else {
            print("Failed to convert photo data to image")
            return
        }

        self.capturedImage = image
    }

}

struct CameraPreview : UIViewRepresentable{
    @ObservedObject var camera : CameraModel
    func makeUIView(context:Context) -> UIView {
        let view = UIView(frame:UIScreen.main.bounds)
        camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
        camera.preview.frame = view.frame
        camera.preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(camera.preview)
        self.camera.session.startRunning()
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {

    }
}

