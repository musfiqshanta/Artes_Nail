// import 'package:artas_nails/main.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_ml_vision/google_ml_vision.dart';
// import 'package:camera/camera.dart';
//
// class FingerCamera{
//
//   final ImageLabeler _imageLabeler = GoogleVision.instance.imageLabeler();
//   CameraController? camera;
//   bool palmFound = false;
//   int palmFoundCount = 0;
//
//   Future<void> initializeCamera() async {
//     final CameraDescription description =
//     await getCamera(CameraLensDirection.back);
//
//     camera = CameraController(
//       description,
//       ResolutionPreset.low,
//       enableAudio: false,
//     );
//     await camera!.initialize();
//     await camera!.startImageStream((CameraImage image) {
//       if (!palmFound) {
//         detect(
//           image: image,
//           detectInImage: _getDetectionMethod(),
//           imageRotation: description.sensorOrientation,
//         ).then(
//               (dynamic results) {
//             for (var element in results) {
//               //// you can use 'eyelash' for eye detection.
//               if (element.text!.toLowerCase() == 'hand' &&
//                   element.confidence! > 0.75) {
//                 palmFoundCount = palmFoundCount + 1;
//                 if (palmFoundCount == 50) {
//                   palmFound = true;
//                   if (palmFound) {
//                     // do your code if hand detect.
//                   }
//                 }
//               }
//             }
//           },
//         );
//       }
//     });
//   }
//    Future<dynamic> detect({
//     required CameraImage image,
//     required Future<dynamic> Function(GoogleVisionImage image) detectInImage,
//     required int imageRotation,
//   }) async {
//     return detectInImage(
//       GoogleVisionImage.fromBytes(
//         _concatenatePlanes(image.planes),
//         _buildMetaData(image, _rotationIntToImageRotation(imageRotation)),
//       ),
//     );
//   }
//    Uint8List _concatenatePlanes(List<Plane> planes) {
//     final WriteBuffer allBytes = WriteBuffer();
//     for (var plane in planes) {
//       allBytes.putUint8List(plane.bytes);
//     }
//     return allBytes.done().buffer.asUint8List();
//   }
//
//    GoogleVisionImageMetadata _buildMetaData(
//       CameraImage image,
//       ImageRotation rotation,
//       ) {
//     return GoogleVisionImageMetadata(
//       rawFormat: image.format.raw,
//       size: Size(image.width.toDouble(), image.height.toDouble()),
//       rotation: rotation,
//       planeData: image.planes.map(
//             (Plane plane) {
//           return GoogleVisionImagePlaneMetadata(
//             bytesPerRow: plane.bytesPerRow,
//             height: plane.height,
//             width: plane.width,
//           );
//         },
//       ).toList(),
//     );
//   }
//
//    ImageRotation _rotationIntToImageRotation(int rotation) {
//     switch (rotation) {
//       case 0:
//         return ImageRotation.rotation0;
//       case 90:
//         return ImageRotation.rotation90;
//       case 180:
//         return ImageRotation.rotation180;
//       default:
//         assert(rotation == 270);
//         return ImageRotation.rotation270;
//     }
//   }
//    Future<CameraDescription> getCamera(CameraLensDirection dir) async {
//     return availableCameras().then(
//           (List<CameraDescription> cameras) => cameras.firstWhere(
//             (CameraDescription camera) => camera.lensDirection == dir,
//       ),
//     );
//   }
//   Future<dynamic> Function(GoogleVisionImage image) _getDetectionMethod() {
//     return _imageLabeler.processImage;
//   }
//
//
// }