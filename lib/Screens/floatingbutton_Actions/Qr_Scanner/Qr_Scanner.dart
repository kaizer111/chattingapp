import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'FoundQrCodeSuccesfully.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
MobileScannerController cameraController = MobileScannerController();
bool _screenOpened = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 145, 193, 232),
        title: const Text("Mobile Scanner"),
        actions: [
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                switch (state as TorchState) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: Colors.grey);
                  case TorchState.on:
                    return const Icon(Icons.flash_on, color: Colors.yellow);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: Colors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: MobileScanner(
        //fit: BoxFit.fill,
        allowDuplicates: true,
        controller: cameraController,
        onDetect: _foundBarcode,
      ),
    );
  }
  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    /// open screen
    if (!_screenOpened) {
      final String code = barcode.rawValue ?? "";
   
      debugPrint('Barcode found! $code');
      _screenOpened = true;
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          FoundCodeScreen(screenClosed: _screenWasClosed, value: code),));
    }
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}