import 'package:lui_fe/features/auth/models/register_form_model.dart';

final registerVM = ChangeNotifierProvider.autoDispose<RegisterVM>(RegisterVM.new);

class RegisterVM extends BaseFormNotifier<RegisterFormModel> with FormValidatorMixin, CustomToastMixin {
    RegisterVM(super.ref);
    
}
