
import 'package:permission_handler/permission_handler.dart';

class PermissonsConfig{


  Future<PermissionStatus> requestfor_Notifications() async {
    var permission = await Permission.notification.status;
    if (permission != PermissionStatus.granted) {
      await Permission.notification.request().then((value) {
        permission = value;
      });
    }

    return permission;
  }


}