import 'api_wrapper.dart' as api;
import 'globals.dart' as globals;

void main() async {
  // await dotenv.load(fileName: 'assets/env/.env');
  // globals.backendKey = dotenv.get("backendKey");

  globals.backendKey = "7c2ae4be5eae166c442b8e74919eda77253a1cfd0fa7f8fcafd984f0b2cdc0e7";

  // Map result = await api.User.getUser(user_id: 1);
  List result = await api.Contest.getContests();
  print(result.length);
  print(result[0]["name"]);
}
