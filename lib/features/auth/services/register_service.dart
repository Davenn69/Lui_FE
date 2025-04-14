import 'package:lui_fe/core/bases/base_service.dart';
import 'package:lui_fe/core/mixins/custom_toast_mixin.dart';

class RegisterService extends BaseService {
    RegisterService() : super();

    Future<dynamic> register({required String email, String? password) async {
       try {
            final response = await post(
                url: 'auth/register',
                body: {
                    'email': email,
                    'password': password,
                }
            );
            return response.data;
        } catch (e) {
            showCustomToast('Registration Failed', isError = true);
            rethrow;
        }
    }
}
