import 'api_wrapper.dart' as api;

void main() async {
  Map result = await api.User.addUser();

  print(result);
}
