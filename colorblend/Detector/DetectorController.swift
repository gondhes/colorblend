//
//  DetectorController.swift
//  colorblend
//
//  Created by Fajar Wirazdi on 23/07/23.
//

import UIKit
import SwiftUI
import AVFoundation
import Vision

class DetectorController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate, ObservableObject {

    private var permissionGranted = false // Flag for permission
    @Published var captureSession = AVCaptureSession()
    @Published var colorPicked = "blue" {
        didSet {
            setupDetector()
        }
    }
    private let sessionQueue = DispatchQueue(label: "sessionQueue")
    private var previewLayer = AVCaptureVideoPreviewLayer()
    var screenRect: CGRect! = nil // For view dimensions

    @Published var currentDevice2: AVCaptureDevice?

    // Detector
    private var videoOutput = AVCaptureVideoDataOutput()
    var requests = [VNRequest]()
    var detectionLayer: CALayer! = nil

    override func viewDidLoad() {
        checkPermission()

        sessionQueue.async { [unowned self] in
            guard permissionGranted else { return }
            self.setupCaptureSession()

            self.setupLayers()
            self.setupDetector()

            self.captureSession.startRunning()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopSession()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.startSession()
    }

    func startSession() {
        DispatchQueue.global().async {
            self.captureSession.startRunning()
        }
    }

    func stopSession() {
        if captureSession.isRunning {
            DispatchQueue.global().async {
                self.captureSession.stopRunning()
            }
        }
    }

    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator) {
        screenRect = UIScreen.main.bounds
        self.previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)

        switch UIDevice.current.orientation {
            // Home button on top
        case UIDeviceOrientation.portraitUpsideDown:
            self.previewLayer.connection?.videoOrientation = .portraitUpsideDown

            // Home button on right
        case UIDeviceOrientation.landscapeLeft:
            self.previewLayer.connection?.videoOrientation = .landscapeRight

            // Home button on left
        case UIDeviceOrientation.landscapeRight:
            self.previewLayer.connection?.videoOrientation = .landscapeLeft

            // Home button at bottom
        case UIDeviceOrientation.portrait:
            self.previewLayer.connection?.videoOrientation = .portrait

        default:
            break
        }

        // Detector
        updateLayers()
    }

    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            // Permission has been granted before
        case .authorized:
            permissionGranted = true

            // Permission has not been requested yet
        case .notDetermined:
            requestPermission()

        default:
            permissionGranted = false
        }
    }

    func requestPermission() {
        sessionQueue.suspend()
        AVCaptureDevice.requestAccess(for: .video) { [unowned self] granted in
            self.permissionGranted = granted
            self.sessionQueue.resume()
        }
    }

    func setupCaptureSession() {
        // Camera input
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                        for: .video,
                                                        position: .back) else { return }
        self.currentDevice2 = videoDevice
        do {
            let videoDeviceInput = try AVCaptureDeviceInput(device: currentDevice2!)

            guard captureSession.canAddInput(videoDeviceInput) else { return }
            captureSession.addInput(videoDeviceInput)
            } catch {
            print(error)
        }

        // Preview layer
        screenRect = UIScreen.main.bounds

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = CGRect(x: 0, y: 0, width: screenRect.size.width, height: screenRect.size.height)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill // Fill screen
        previewLayer.connection?.videoOrientation = .portrait

        // Detector
        videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "sampleBufferQueue"))
        captureSession.addOutput(videoOutput)

        videoOutput.connection(with: .video)?.videoOrientation = .portrait

        // Updates to UI must be on main queue
        DispatchQueue.main.async { [weak self] in
            self!.view.layer.addSublayer(self!.previewLayer)
        }
    }
}

struct HostedViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = DetectorController
    @ObservedObject var cameraSearch: DetectorController
    func makeUIViewController(context: Context) -> DetectorController {
        let view = DetectorController()
        return view
    }

    func updateUIViewController(_ uiViewController: DetectorController, context: Context) {
    }
}
