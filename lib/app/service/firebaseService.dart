
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {


  static Future<void> initializeFirebase() async {
    await  Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyB-RuiM60wENZrb1U7NzxDqy6HVO3ysLqE',
        appId: '1:756250378645:android:6f8a5eabb80e19fc2ab69c',
        messagingSenderId: '756250378645',
        projectId: 'fcmtest-8ff37',
      ),
    );
  }
}
