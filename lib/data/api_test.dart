import 'api_wrapper.dart' as api;
import 'globals.dart' as globals;

void main() async {
  // await dotenv.load(fileName: 'assets/env/.env');
  // globals.backendKey = dotenv.get("backendKey");

  globals.backendKey = "0000000000000000000000000000000000000000000000000000000000000000";

  // Map result = await api.User.getUser(user_id: 1);
  List result = await api.Contest.getContests();
  print(result.length);
  print(result[0]["name"]);
}
