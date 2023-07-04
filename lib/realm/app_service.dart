import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

class AppService {
  App? appService = App(AppConfiguration("chatrealmtest-1-plsko"));
  User? user;
  String appId = "chatrealmtest-1-plsko";
  final App appConfig = App(AppConfiguration("chatrealmtest-1-plsko"));
  Future<User> login(String email, String password) async {
    appService = App(AppConfiguration(appId));
    return await appService!.logIn(Credentials.emailPassword(email, password));
  }

  Future<User> register(String email, String password) async {
    appService = App(AppConfiguration(appId));
    await appService!.emailPasswordAuthProvider.registerUser(email, password);
    return await appService!.logIn(Credentials.emailPassword(email, password));
  }

  Future<void> logout() async {
    appService = App(AppConfiguration(appId));
    await appService!.currentUser!.logOut();
  }
}

final appserviceProvider = Provider<AppService>((ref) {
  return AppService();
});
