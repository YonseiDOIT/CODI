import 'api_wrapper.dart' as api;
import 'globals.dart' as globals;

void main() async {
  // await dotenv.load(fileName: 'assets/env/.env');
  // globals.backendKey = dotenv.get("backendKey");

  List result = await api.RecruitmentPost.getPosts();
  print(result);
}
