import '../helpers/loading_widget.dart';
import 'api_service.dart';

class AuthService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await ApiService(
      'https://reqres.in/',
      'api/login',
      setMethot: 'post',
      setParam: {
        'email': email,
        'password': password,
      },
      loading: true,
    ).fetchData();
    if (!response['error']) {
      return {'status': true, 'data': response['data']};
    } else {
      if (response['data'].containsKey('error')) {
        return {'status': false, 'message': response['data']['error']};
      } else {
        Lt.toast(response['error_msg']);
        return {};
      }
    }
  }
}
