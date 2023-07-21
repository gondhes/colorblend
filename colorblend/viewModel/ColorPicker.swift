//
//  ColorPicker.swift
//  colorblend
//
//  Created by Hafidz Ismail Hidayat on 20/07/23.
//

import AVFoundation
import SwiftUI
import UIKit
import CoreML

let WIDTH = UIScreen.main.bounds.width
let HEIGHT = UIScreen.main.bounds.height

protocol ViewControllerDelegate: AnyObject {
    func classificationOccured(_ viewController: ViewController, identifier: UIColor)
}

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var captureSession = AVCaptureSession()
    @Published var previewtest : AVCaptureVideoPreviewLayer!
    @Published var output = AVCapturePhotoOutput()
    @Published var isTaken = false
    @Published var showSheet = false
    @Published var capturedImage: UIImage?
    @State var colorPick: UIColor?
    @Published var isStop = false

    var backFacingCamera: AVCaptureDevice?
    @Published var currentDevice: AVCaptureDevice?
    
    weak var delegate: ViewControllerDelegate?
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }
        CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: CVOptionFlags(0)))
        guard let baseAddr = CVPixelBufferGetBaseAddressOfPlane(imageBuffer, 0) else {
            return
        }
        let width = CVPixelBufferGetWidthOfPlane(imageBuffer, 0)
        let height = CVPixelBufferGetHeightOfPlane(imageBuffer, 0)
        let bytesPerRow = CVPixelBufferGetBytesPerRowOfPlane(imageBuffer, 0)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bimapInfo: CGBitmapInfo = [
            .byteOrder32Little,
            CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue)]
        
        guard let content = CGContext(data: baseAddr, width: width, height: height, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bimapInfo.rawValue) else {
            return
        }
        
        guard let cgImage = content.makeImage() else {
            return
        }
        DispatchQueue.main.async {
            self.previewLayer.contents = cgImage
            let color = self.previewLayer.pickColor(at: self.center)
            self.square.fillColor = color?.cgColor
            if color != self.colorPick {
                self.colorPick = color
                self.delegate?.classificationOccured(self, identifier: color ?? UIColor.black)
            }
//            print("color:", color)
            let redColor = (color?.cgColor.components?[0] ?? 0)*255
            let greenColor = (color?.cgColor.components?[1] ?? 0)*255
            let blueColor = (color?.cgColor.components?[2] ?? 0)*255
                     
            do{
                let config = MLModelConfiguration()
                let model = try colorblend.ColorLabelFix(configuration:config)
                
                let prediction = try model.prediction(red: Double(redColor), green: Double(greenColor), blue: Double(blueColor))
                self.label.text = prediction.label

            }catch{
                print("Error")
            }
            
            
//            if redColor >= 125 && greenColor >= 125 && blueColor >= 125{
//                self.label.text = "Light"
//            } else if redColor <= 125 && greenColor <= 125 && blueColor <= 125{
//                self.label.text = "Dark"
//            }
        }
    }
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }

        if device.hasTorch {
            do {
                try device.lockForConfiguration()

                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }

                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    let previewLayer = CALayer()
    let lineShape = CAShapeLayer()
    let label = UILabel()
    let square = CAShapeLayer()
    

    func setupUI() {
        previewLayer.bounds = CGRect(x: 0, y: 0, width: WIDTH/2, height: HEIGHT/2)
        previewLayer.position = view.center
        previewLayer.contentsGravity = CALayerContentsGravity.resizeAspectFill
        previewLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(.pi / 2.0)))
        view.layer.insertSublayer(previewLayer, at: 0)
        
        //圆点 - bintik
        let linePath1 = UIBezierPath.init(ovalIn: CGRect.init(x: 0, y: 0, width: 8, height: 8))
        let lineShape1 = CAShapeLayer()
        lineShape1.frame = CGRect.init(x: WIDTH/2-4, y:HEIGHT/2-4, width: 8, height: 8)
        lineShape1.path = linePath1.cgPath
        lineShape1.fillColor = UIColor.init(white: 0.7, alpha: 0.5).cgColor
        self.view.layer.insertSublayer(lineShape1, at: 1)
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.tintColor = UIColor.black
        view.addSubview(label)
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        //Rectangle
        let squarePath = UIBezierPath()
        squarePath.move(to: CGPoint(x: 0, y: 0))
        squarePath.addLine(to: CGPoint(x: 430, y: 0))
        squarePath.addLine(to: CGPoint(x: 430, y: 168))
        squarePath.addLine(to: CGPoint(x: 0, y: 168))
        squarePath.close()
        
        square.path=squarePath.cgPath
        square.fillColor = UIColor.black.cgColor
        self.view.layer.addSublayer(square)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        self.CreateUI()
        DispatchQueue.global(qos: .background).async {
            self.captureSession.startRunning()
        }
    }
    
    let queue = DispatchQueue(label: "com.camera.video.queue")
    var center: CGPoint = CGPoint(x: WIDTH/4, y: HEIGHT/4)
    
    
    
    func CreateUI(){
        self.captureSession.sessionPreset = AVCaptureSession.Preset.hd1280x720
        let devices = AVCaptureDevice.devices(for: AVMediaType.video)
        for device in devices {
            if device.position == AVCaptureDevice.Position.back {
                self.backFacingCamera = device
            }
        }
        self.currentDevice = self.backFacingCamera
        do {
            let captureDeviceInput = try AVCaptureDeviceInput(device: currentDevice!)
            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey as AnyHashable: NSNumber(value: kCMPixelFormat_32BGRA)] as? [String : Any]
            videoOutput.alwaysDiscardsLateVideoFrames = true
            videoOutput.setSampleBufferDelegate(self, queue: queue)
            
            if self.captureSession.canAddOutput(videoOutput) {
                self.captureSession.addOutput(videoOutput)
            }
            self.captureSession.addInput(captureDeviceInput)
        } catch {
            print(error)
            return
        }
    }
}


extension CALayer: ObservableObject {
    func pickColor(at position: CGPoint) -> UIColor? {
        var pixel = [UInt8](repeatElement(0, count: 4))
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGImageAlphaInfo.premultipliedLast.rawValue
        guard let context = CGContext(data: &pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo) else {
            return nil
        }
        context.translateBy(x: -position.x, y: -position.y)
        render(in: context)
        return UIColor(red: CGFloat(pixel[0]) / 255.0,
                       green: CGFloat(pixel[1]) / 255.0,
                       blue: CGFloat(pixel[2]) / 255.0,
                       alpha: CGFloat(pixel[3]) / 255.0)
    }
}

struct CameraTestPreview: UIViewControllerRepresentable{
    typealias UIViewControllerType = ViewController
    @ObservedObject var cameratest: ViewController
    let identifier: Binding<UIColor>
    
    class Coordinator: ViewControllerDelegate {
        var identifierBinding: Binding<UIColor>
        
        init(identifierBinding: Binding<UIColor>) {
            self.identifierBinding = identifierBinding
        }
        
        func classificationOccured(_ viewController: ViewController, identifier: UIColor) {
            print("identifier di classification: ", identifier)
            identifierBinding.wrappedValue = identifier
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(identifierBinding: identifier)
    }
    
    func makeUIViewController(context:Context) -> ViewController {
        let view = ViewController()
        view.delegate = context.coordinator
        return view
    }
    func updateUIViewController(_ uitestView: ViewController, context: Context){
        
    }
}
