import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_note/providers/user.provider.dart';
import 'package:flutter_note/screen/landing-page.screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> cameras;

void main() async {
  await GetStorage.init();
  await Firebase.initializeApp();
  cameras = await availableCameras();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appUser = AppUser();

    return MultiProvider(
      providers: [ChangeNotifierProvider<AppUser>.value(value: appUser)],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: LandingPage(),
          );
        },
      ),
    );
  }
}

// void main() async {
//   await GetStorage.init();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   final box = GetStorage();
//   @override
//   Widget build(BuildContext context) {
//     final taskList = box.read('taskList');
//     final List<Task> list = taskList != null
//         ? List.from((taskList as List<dynamic>).map((e) => Task.fromMap(e)))
//         : [];
//
//     final taskListProvider = TaskListProvider(taskList: list);
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<TaskListProvider>.value(value: taskListProvider)
//       ],
//       child: Builder(
//         builder: (context) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             theme: ThemeData(
//               primarySwatch: Colors.blue,
//             ),
//             home: TestScreen(),
//           );
//         },
//       ),
//     );
//   }
// }
