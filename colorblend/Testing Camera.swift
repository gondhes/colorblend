////
////  Testing Camera.swift
////  colorblend
////
////  Created by Hafidz Ismail Hidayat on 26/07/23.
////
//
// import AVFoundation
//
// class TestingCamera{
//    var captureSession: AVCaptureSession?
//    var frontCamera: AVCaptureDevice?
//    var rearCamera: AVCaptureDevice?
//    var currentCameraPosition: CameraPosition?
//    var frontCameraInput: AVCaptureDeviceInput?
//    var rearCameraInput: AVCaptureDeviceInput?
//    var photoOutput: AVCapturePhotoOutput?
// }
//
// extension TestingCamera{
//    func prepare(completionHandler: @escaping (Error?) -> Void) {
//        func createCaptureSession() {
//            self.captureSession = AVCaptureSession()
//        }
//        
//        func configureCaptureDevices() throws {
// let session = AVCaptureDeviceDiscoverySession
// (deviceTypes: [.builtInWideAngleCamera], mediaType: AVMediaTypeVideo, position: .unspecified)
//            guard let cameras = (session?.devices.flatMap { $0 }), !cameras.isEmpty
// else { throw CameraControllerError.noCamerasAvailable }
//            
//            for camera in cameras {
//                if camera.position == .front {
//                    self.frontCamera = camera
//                }
//                
//                if camera.position == .back {
//                    self.rearCamera = camera
//                    
//                    try camera.lockForConfiguration()
//                    camera.focusMode = .continuousAutoFocus
//                    camera.unlockForConfiguration()
//                }
//            }
//        }
//        
//        func configureDeviceInputs() throws {
//            guard let captureSession = self.captureSession else {
// throw CameraControllerError.captureSessionIsMissing }
//            
//            //4
//            if let rearCamera = self.rearCamera {
//                self.rearCameraInput = try AVCaptureDeviceInput(device: rearCamera)
//                
//                if captureSession.canAddInput(self.rearCameraInput!) {
// captureSession.addInput(self.rearCameraInput!) }
//                
//                self.currentCameraPosition = .rear
//            }
//            
//            else if let frontCamera = self.frontCamera {
//                self.frontCameraInput = try AVCaptureDeviceInput(device: frontCamera)
//                
//                if captureSession.canAddInput(self.frontCameraInput!)
// { captureSession.addInput(self.frontCameraInput!) }
//                else { throw CameraControllerError.inputsAreInvalid }
//                
//                self.currentCameraPosition = .front
//            }
//            
//            else { throw CameraControllerError.noCamerasAvailable }
//        }
//        func configurePhotoOutput() throws {
//            guard let captureSession = self.captureSession else {
// throw CameraControllerError.captureSessionIsMissing }
//            
//            self.photoOutput = AVCapturePhotoOutput()
//            
//            if captureSession.canAddOutput(self.photoOutput) { captureSession.addOutput(self.photoOutput) }
//            
//            captureSession.startRunning()
//        }
//        DispatchQueue(label: "prepare").async {
//            do {
//                createCaptureSession()
//                try configureCaptureDevices()
//                try configureDeviceInputs()
//                try configurePhotoOutput()
//            }
//            
//            catch {
//                DispatchQueue.main.async {
//                    completionHandler(error)
//                }
//                
//                return
//            }
//            
//            DispatchQueue.main.async {
//                completionHandler(nil)
//            }
//        }
//    }
// }
//
// extension TestingCamera{
//    enum TestingCameraError: Swift.Error{
//        case captureSessionAlreadyRunning
//        case captureSessionIsMissing
//        case inputsAreInvalid
//        case invalidOperation
//        case noCamerasAvailable
//        case unknown
// }
//
// public enum CameraPosition {
//    case front
//    case rear
// }
//
