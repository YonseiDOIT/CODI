import 'api_wrapper.dart' as api;
import 'globals.dart' as globals;

void main() async {
  // await dotenv.load(fileName: 'assets/env/.env');
  // globals.backendKey = dotenv.get("backendKey");

  Map result = await api.User.getUser(user_id: 1);
  print(result);
}
