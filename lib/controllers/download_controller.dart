// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

// Future<void> downloadImage(String imageUrl) async {
//   try {
//     // 1️⃣ Ask for permissions
//     if (Platform.isAndroid) {
//       final status = await Permission.storage.request();
//       if (!status.isGranted) {
//         print("Permission denied");
//         return;
//       }
//     }

//     // 2️⃣ Download image bytes
//     final response = await http.get(Uri.parse(imageUrl));
//     if (response.statusCode != 200) throw Exception('Failed to download image');

//     // 3️⃣ Get Downloads folder
//     Directory? downloadDir;
//     if (Platform.isAndroid) {
//       downloadDir = Directory('/storage/emulated/0/Download');
//     } else {
//       downloadDir = await getApplicationDocumentsDirectory();
//     }

//     // 4️⃣ Save file
//     final fileName = 'dp_${DateTime.now().millisecondsSinceEpoch}.jpg';
//     final file = File('${downloadDir.path}/$fileName');
//     await file.writeAsBytes(response.bodyBytes);

//     print('✅ Image saved to: ${file.path}');
//   } catch (e) {
//     print('❌ Error saving image: $e');
//   }
// }
