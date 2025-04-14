import 'dart:async';

import 'package:lui_fe/core/mixins/form_validator_mixin.dart';
import 'package:lui_fe/core/models/text_input_model.dart';
import 'package:lui_fe/features/auth/models/register_form_model.dart';
import 'package:lui_fe/features/auth/services/register_service.dart';

final registerVM = ChangeNotifierProvider.autoDispose<RegisterVM>(RegisterVM.new);

class RegisterVM extends BaseFormNotifier<RegisterFormModel> with FormValidatorMixin, CustomToastMixin {
    RegisterVM(super.ref);

    @override 
    late RegisterFormModel form;

    final RegisterService _service = RegisterService();

    @override
    FutureOr<void> init() {
        form = RegisterFormModel(
            email: TextInputModel(
                validator: (value) => getValidation(
                    value: value,
                    label: 'Email',
                    validationList: [
                        Validator.emailFormat,
                    ]
                )
            ),
            password: TextInputModel(
                validator: (value) => getValidation(
                    value: value,
                    label: 'Password',
                    validationList: [
                        Validator.passwordFormat,
                    ]
                )
            ),
            confirmPassword: TextInputModel(
                validator: (value) => getValidation(
                    value: value,
                    label: 'Confirm Password',
                    validationList: [
                        Validator.confirmPassword,
                    ]
                )
            ),
        ); 
    }
}
